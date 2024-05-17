function fetchQuestionAndOptions(qaId) {
    var xhr = new XMLHttpRequest();
    xhr.open('GET', '/api/qa/' + qaId);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        if (xhr.status === 200) {
            var data = JSON.parse(xhr.responseText);
            displayQuestionAndOptions(qaId, data.question, data.options , data.img);
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

    image = loadSVG(img);

    document.getElementById('img').appendChild(image);

    var optionsContainer = document.getElementById('options');
    optionsContainer.innerHTML = '';
    options.forEach(function(option) {
        var button = document.createElement('button');
        button.textContent = option;
        button.classList.add('answer-button', 'bg-gray-200', 'hover:bg-gray-300', 'text-gray-800', 'font-semibold', 'py-2', 'px-4', 'rounded', 'mr-2');
        button.onclick = function() {
            checkAnswer(qaId, option);
        };
        optionsContainer.appendChild(button);
    });
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
                if (btn.textContent === correctAnswer) {
                    btn.classList.remove('bg-gray-200', 'hover:bg-gray-300');
                    btn.classList.add('bg-green-500', 'hover:bg-green-400');
                }
            });

            var selectedButton = [...buttons].find(btn => btn.textContent === userAnswer);
            if (selectedButton) {
                selectedButton.classList.remove('hover:bg-gray-300');
                if (userAnswer === correctAnswer) {
                    selectedButton.classList.add('bg-green-500', 'hover:bg-green-400');
                } else {
                    selectedButton.classList.add('bg-red-500', 'hover:bg-red-400');
                }
            }

        } else {
            console.error('Request failed. Status:', xhr.status);
        }
    };
    xhr.send();
}
