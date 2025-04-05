document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.confirm-password')

  if (control) { control.addEventListener('input', checkPassword) }
})

function checkPassword() {
  const password = document.querySelector('input[id="user_password"]').value;
  const password_confirmation = document.querySelector('input[id="user_password_confirmation"]').value;

  if (!password_confirmation) {
    this.querySelector('.octicon-shield-check').classList.add('hide');
    this.querySelector('.octicon-shield-x').classList.add('hide');
  } else if (password_confirmation === password) {
    this.querySelector('.octicon-shield-check').classList.remove('hide');
    this.querySelector('.octicon-shield-x').classList.add('hide');
  } else {
    this.querySelector('.octicon-shield-x').classList.remove('hide');
    this.querySelector('.octicon-shield-check').classList.add('hide');
  }
}
