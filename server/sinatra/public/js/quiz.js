let qaIds = [];
let currentQaIndex = 0;
let correctAnswers = 0;
let examId;
let currentUser;

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
                btn.disabled = true; 
            });

            var selectedButton = [...buttons].find(btn => btn.textContent === userAnswer);
            if (selectedButton) {
                selectedButton.classList.remove('bg-[#e6edf8]', 'hover:bg-[#c7d9f0]');
                if (userAnswer === correctAnswer) {
                    correctAnswers++;
                    selectedButton.classList.add('bg-green-500', 'hover:bg-green-400');
                    currentUser.current_streak ++;
                    updateStreak(currentUser.current_streak);
                } else {
                    selectedButton.classList.add('bg-red-500');
                    currentUser.current_streak = 0;
                    updateStreak(currentUser.current_streak);
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
                addCompletedLesson();
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
            qaIds = data.qas; // Store the retrieved QA IDs
            fetchNextQuestion(examId); // Start fetching questions for the first QA ID
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
        document.getElementById('question').style.display = 'none';
        document.getElementById('center-svg-container').style.display = 'none';
        document.getElementById('options').style.display = 'none';
        document.getElementById('next-question').style.display = 'none';
        document.getElementById('completion-message').style.display = 'block';
        document.getElementById('correct-answers').textContent = correctAnswers;
        checkLevelUp(examId);
    }
}

function addCompletedLesson() {
    console.log('updatinggggg')
    fetch('/completed_lesson', {
        method: 'POST', 
        headers: {
            'Content-Type' : 'application/json',
        },
        body: JSON.stringify({id: currentUser.id}),
    });
}

function updateStreak(streak) {
    fetch('/update_streak', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ id: currentUser.id, current_streak: streak }),
    });
}




document.getElementById('next-question').addEventListener('click', fetchNextQuestion);

