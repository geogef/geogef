let qaIds = [];
let currentQaIndex = 0;
let correctAnswers = 0;
let examId;
let currentUser;
let timerDuration = 300; // Duración del temporizador en segundos
let timerInterval;
let timeLeft;

function setCurrentUser(user) {
    currentUser = user;
}

function fetchQuestionAndOptions(qaId) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/api/qa/' + qaId);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            displayQuestionAndOptions(qaId, data.question, data.options, data.img);
        } else {
            console.error('Request failed. Status:', xhr.status);
        }
    };
    xhr.send();
}

function loadSVG(url) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", url, false);
    xhr.overrideMimeType("image/svg+xml");
    xhr.send(null);

    if (xhr.status === 200) {
        return xhr.responseXML.documentElement;
    }

    return null;
}

function displayQuestionAndOptions(qaId, question, options, img) {
    document.getElementById('question').textContent = question;

    var svgContainer = document.getElementById('svg-container');
    svgContainer.innerHTML = '';

    if (img) {
        var image = loadSVG(img);
        svgContainer.appendChild(image);
    }

    var optionsContainer = document.getElementById('options');
    optionsContainer.innerHTML = '';
    options.forEach(function(option) {
        var button = document.createElement('button');
        button.textContent = option;
        button.classList.add('answer-button', 'bg-[#e6edf8]', 'hover:bg-[#c7d9f0]', 'font-semibold', 'py-2', 'px-4', 'rounded', 'mr-2', 'transition', 'duration-300');
        button.onclick = function() {
            checkAnswer(qaId, option);
        };
        optionsContainer.appendChild(button);
    });

    document.getElementById('next-question').disabled = true;
    document.getElementById('next-question').classList.add('bg-fun-blue-950');
}

function checkAnswer(qaId, userAnswer) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/api/qa/' + qaId + '/correct_answer');
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            var correctAnswer = data.correct_answer;

            var buttons = document.querySelectorAll('.answer-button');
            buttons.forEach(function(btn) {
                btn.classList.remove('bg-green-500', 'hover:bg-green-500', 'bg-red-500', 'hover:bg-red-500');
                btn.disabled = true; // Deshabilita todos los botones de respuesta
            });

            var selectedButton = [...buttons].find(btn => btn.textContent === userAnswer);
            if (selectedButton) {
                selectedButton.classList.remove('bg-[#e6edf8]', 'hover:bg-[#c7d9f0]');
                if (userAnswer === correctAnswer) {
                    correctAnswers++;
                    let currentStreak = parseInt(localStorage.getItem("highestStreak"));
                    currentStreak++;
                    localStorage.setItem("highestStreak", currentStreak);
                    selectedButton.classList.add('bg-green-500', 'hover:bg-green-400');
                } else {
                    const highestStreak = parseInt(localStorage.getItem('highestStreak'), 10) || 0;
                    if (highestStreak > currentUser.highest_streak) {
                        updateStreak(highestStreak);
                    }
                    localStorage.setItem("highestStreak", 0);
                    selectedButton.classList.add('bg-red-500');
                }
            }

            document.getElementById('next-question').disabled = false;
            document.getElementById('next-question').classList.remove('bg-fun-blue-950');
        } else {
            console.error('Request failed. Status:', xhr.status);
        }
    };
    xhr.send();
}


function checkLevelUp() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', `/api/exam/${examId}/${correctAnswers}`);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            document.getElementById('question').style.display = 'none';
            document.getElementById('center-svg-container').style.display = 'none';
            document.getElementById('options').style.display = 'none';
            document.getElementById('next-question').style.display = 'none';
            document.getElementById('completion-message').style.display = 'block';

            if (data.message === 'Level up!') {
                document.getElementById('completion-message').innerHTML = `
                    <p class="text-center text-gray-600">Congratulations! You have completed the quiz.</p>
                    <p class="text-center text-gray-600">You answered <span id="correct-answers">${correctAnswers}</span> questions correctly.</p>
                    <p class="text-center text-gray-600">You have been promoted to the next level: ${data.new_level}.</p>
                    <p class="text-center text-gray-600">Thank you for participating.</p>`;
            } else {
                document.getElementById('completion-message').innerHTML = `
                    <p class="text-center text-gray-600">Congratulations! You have completed the quiz.</p>
                    <p class="text-center text-gray-600">You answered <span id="correct-answers">${correctAnswers}</span> questions correctly.</p>
                    <p class="text-center text-gray-600">${data.message}</p>
                    <p class="text-center text-gray-600">Thank you for participating.</p>`;
            }
        } else {
            console.error('Request failed. Status:', xhr.status);
        }
    };
    xhr.send();
}

// Function to fetch QA IDs from the API endpoint
function fetchQaIds(Id) {
    examId = Id;
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/api/exam/' + examId);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            qaIds = data.qas;
            fetchNextQuestion(examId);
            startTimer(timerDuration); // Start the timer
        } else {
            console.error('Request failed. Status:', xhr.status);
        }
    };
    xhr.send();
}


// Function to fetch and display the next question
function fetchNextQuestion() {
    console.log(examId);
    if (currentQaIndex < qaIds.length) {
        var qaId = qaIds[currentQaIndex];
        fetchQuestionAndOptions(qaId); // Fetch question for the current QA ID
        currentQaIndex++; // Move to the next QA ID for the next iteration
    } else {
        console.log('All questions fetched.');
        clearInterval(timerInterval); // Stop the timer
        document.getElementById('question').style.display = 'none';
        document.getElementById('center-svg-container').style.display = 'none';
        document.getElementById('options').style.display = 'none';
        document.getElementById('next-question').style.display = 'none';
        document.getElementById('completion-message').style.display = 'block';
        document.getElementById('correct-answers').textContent = correctAnswers;
        checkLevelUp(examId);
    }
}


function updateStreak(newStreak) {
    currentUser.highest_streak = newStreak;
    const user = JSON.parse(localStorage.getItem('user'));
    fetch('/update_streak', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ id: currentUser.id, highest_streak: newStreak }),
    })
        .then(response => response.json())
        .then(data => {
            console.log('Streak updated:', data);
            if (data.status === 'success') {
                console.log('Streak successfully updated.');
            } else {
                console.error('Error updating streak:', data.message);
            }
        })
        .catch(error => console.error('Error:', error));
}

function startTimer(duration) {
    timeLeft = duration;
    updateTimerDisplay();

    timerInterval = setInterval(function() {
        timeLeft--;
        updateTimerDisplay();

        if (timeLeft <= 0) {
            clearInterval(timerInterval);
            endQuiz();
        }
    }, 1000);
}

function updateTimerDisplay() {
    const minutes = Math.floor(timeLeft / 60);
    const seconds = timeLeft % 60;

    document.getElementById('time').textContent = `${minutes < 10 ? '0' : ''}${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
}

function endQuiz() {
    document.getElementById('question').style.display = 'none';
    document.getElementById('center-svg-container').style.display = 'none';
    document.getElementById('options').style.display = 'none';
    document.getElementById('next-question').style.display = 'none';
    document.getElementById('completion-message').style.display = 'block';
    document.getElementById('correct-answers').textContent = correctAnswers;

    checkLevelUp(examId);
}




document.getElementById('next-question').addEventListener('click', fetchNextQuestion);