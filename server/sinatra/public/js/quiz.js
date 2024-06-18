let qaIds = [];
let currentQaIndex = 0;
let correctAnswers = 0;
let examId;
let currentUser;
let timerDuration = 300; //Timer duration
let timerIntervalId; // Variable to store the ID of the active timer interval
let timeLeft;

// Styles for the exam completion message
const completionMessageStyle = `
    padding: 20px;
    border: 1px solid #ccc;
    background-color: #f7fafc;
    margin-top: 20px;
`;

const completionMessageParagraphStyle = `
    font-size: 18px;
    margin-bottom: 10px;
`;

const completionMessageButtonStyle = `
    display: inline-block;
    margin-top: 10px;
    background-color: #3490dc;
    color: #fff;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
`;

const completionMessageButtonHoverStyle = `
    background-color: #2779bd;
`;

// Function to set the current user
function setCurrentUser(user) {
    currentUser = user;
}

// Function to get a question and its options
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

// Function to load an SVG image from a URL
function loadSVG(url) {
    var xhr = new XMLHttpRequest();
    xhr.open("GET", '/' + url, false);
    xhr.overrideMimeType("image/svg+xml");
    xhr.send(null);

    if (xhr.status === 200) {
        return xhr.responseXML.documentElement;
    }

    return null;
}

// Function to show the question and options
function displayQuestionAndOptions(qaId, question, options, img) {
    document.getElementById('question').textContent = question;

    var svgContainer = document.getElementById('svg-container');
    svgContainer.innerHTML = '';

    if (img) {
        var image = loadSVG(img);
        if (image) {
            svgContainer.appendChild(image);
        }
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

    if (!img) {
        svgContainer.style.display = 'none';
    } else {
        svgContainer.style.display = 'block';
    }
}

// Function to check the answer selected by the user
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
                    currentUser.current_streak++;
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

// Function to check level progress after the exam
function checkLevelUp() {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', `/api/exam/${examId}/${correctAnswers}`);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            var completionMessage = document.getElementById('completion-message');
            var correctAnswersSpan = document.getElementById('correct-answers');

            completionMessage.style.display = 'block';
            completionMessage.innerHTML = `
                <p class="text-center text-gray-600">¡Felicitaciones! Has completado correctamente el examen.</p>
                <p class="text-center text-gray-600">Has respondido <span id="correct-answers">${correctAnswers}</span> preguntas correctamente.</p>
                <p class="text-center text-gray-600">Gracias por participar.</p>
                <div class="text-center mt-4">
                    <a href="/lessons_levels" class="completion-message-btn">Volver a los niveles de lecciones</a>
                </div>`;

            if (data.message === 'Level up!') {
                completionMessage.innerHTML += `
                    <p class="text-center text-gray-600">Has desbloqueado el siguiente nivel: ${data.new_level}.</p>`;
                addCompletedLesson();
            } else {
                completionMessage.innerHTML += `
                    <p class="text-center text-gray-600">${data.message}</p>
                    <div class="text-center mt-4">
                        <a id="retry-exam" href="#" class="completion-message-btn">Volver a realizar examen</a>
                    </div>`;
                
                // Add event to repeat the exam
                document.getElementById('retry-exam').addEventListener('click', function(event) {
                    event.preventDefault();
                    retryExam();
                });
            }

            //Style for buttons
            var completionMessageButtons = document.querySelectorAll('.completion-message-btn');
            completionMessageButtons.forEach(button => {
                button.style = completionMessageButtonStyle;
                button.addEventListener('mouseover', function() {
                    button.style.backgroundColor = '#2779bd';
                });
                button.addEventListener('mouseout', function() {
                    button.style.backgroundColor = '#3490dc';
                });
            });
        } else {
            console.error('Request failed. Status:', xhr.status);
        }
    };
    xhr.send();
}

// Function to get and display the next question
function fetchNextQuestion() {
    if (currentQaIndex < qaIds.length) {
        var qaId = qaIds[currentQaIndex];
        fetchQuestionAndOptions(qaId); // Get question for current QA ID
        currentQaIndex++; // Move to next QA ID for next iteration
    } else {
        console.log('Todas las preguntas obtenidas.');
        clearInterval(timerIntervalId); // Stop timer
        document.getElementById('question').style.display = 'none';
        document.getElementById('svg-container').style.display = 'none';
        document.getElementById('options').style.display = 'none';
        document.getElementById('next-question').style.display = 'none';
        document.getElementById('completion-message').style.display = 'block';
        document.getElementById('correct-answers').textContent = correctAnswers;
        checkLevelUp(examId);
    }
}

// Function to add the completed lesson
function addCompletedLesson() {
    fetch('/completed_lesson', {
        method: 'POST', 
        headers: {
            'Content-Type' : 'application/json',
        },
        body: JSON.stringify({id: currentUser.id}),
    });
}

// Function to update user's streak
function updateStreak(streak) {
    fetch('/update_streak', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ id: currentUser.id, current_streak: streak }),
    });
}

// Function to start timer
function startTimer(duration) {
    timeLeft = duration;
    updateTimerDisplay();

    return setInterval(function() {
        timeLeft--;
        updateTimerDisplay();

        if (timeLeft <= 0) {
            clearInterval(timerIntervalId);
            endQuiz();
        }
    }, 1000);
}

// Function to update timer display
function updateTimerDisplay() {
    const minutes = Math.floor(timeLeft / 60);
    const seconds = timeLeft % 60;

    document.getElementById('time').textContent = `${minutes < 10 ? '0' : ''}${minutes}:${seconds < 10 ? '0' : ''}${seconds}`;
}

// Function to end the exam
function endQuiz() {
    document.getElementById('question').style.display = 'none';
    document.getElementById('svg-container').style.display = 'none';
    document.getElementById('options').style.display = 'none';
    document.getElementById('next-question').style.display = 'none';
    document.getElementById('completion-message').style.display = 'block';
    document.getElementById('correct-answers').textContent = correctAnswers;

    checkLevelUp(examId);
}

// Assign event to next question button
document.getElementById('next-question').addEventListener('click', fetchNextQuestion);

// Initial function to get QA IDs and start the exam
function fetchQaIds(Id) {
    examId = Id;
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/api/exam/' + examId);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            qaIds = data.qas;
            fetchNextQuestion();
            // Start timer after getting QA IDs
            timerIntervalId = startTimer(timerDuration);
        } else {
            console.error('La solicitud falló. Estado:', xhr.status);
        }
    };
    xhr.send();
}

// Function to restart the exam
function retryExam() {
    // Stop timer interval if active
    clearInterval(timerIntervalId);

    // Reset variables
    currentQaIndex = 0;
    correctAnswers = 0;

    // Reset the user's current streak
    currentUser.current_streak = 0;
    updateStreak(currentUser.current_streak);

    // Reset remaining time to initial value
    timeLeft = timerDuration;
    updateTimerDisplay();

    // Hide the completion message and show the exam interface
    document.getElementById('completion-message').style.display = 'none';
    document.getElementById('question').style.display = 'block';
    document.getElementById('svg-container').style.display = 'block';
    document.getElementById('options').style.display = 'block';
    document.getElementById('next-question').style.display = 'block';

    // Get the question IDs again and start the exam again
    fetchQaIds(examId);
}

// Assign event to retry exam button
document.getElementById('retry-exam').addEventListener('click', function(event) {
    event.preventDefault();
    retryExam();
});

// Initialization: Get QA IDs and start the exam
fetchQaIds(examId);
