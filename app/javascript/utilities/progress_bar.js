document.addEventListener('turbolinks:load', function() { 
  if ( $(".progress").length) {
    var progress = document.querySelector('.progress')

    if (progress.dataset.currentQuestionNumber > 1) {
      console.log('Hi!')
      move(progress.dataset.currentQuestionNumber, progress.dataset.questionsCount)
    }
  }
})

function move(currentQuestionNumber, questionsCount) {
  var elem = document.getElementById("progress-bar")

  // moving after load next question
  var width = (currentQuestionNumber-2) / questionsCount * 100
  var new_width = (currentQuestionNumber-1) / questionsCount * 100
  
  var id = setInterval(frame, 10)
  function frame() {
    if (width >= new_width) {
      clearInterval(id)
    } else {
      width += 1
      elem.style.width = width + "%"
    }
  }
} 

