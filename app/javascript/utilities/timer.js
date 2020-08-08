document.addEventListener('turbolinks:load', function(){
    const timerData = document.querySelector('#timer')
    if (timerData) {
        startTimer(timerData)
    }
})

function startTimer(timerData) {
    const {timeLeft} = timerData.dataset;
    let timer = Math.round(timeLeft);
    setTimeout(function updateTimer() {
        if (timer > 0) {
            setTimer(timer--)
            setTimeout(updateTimer, 1000)
        } else {
            window.location.href = window.location.href + '/result'
        }
    }, 0)
}

function setTimer(timer) {
    const counterSpan = document.querySelector('#counter');
    counterSpan.innerText = ': ' + timer
}
