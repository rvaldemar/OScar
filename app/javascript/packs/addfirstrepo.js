const repos = document.querySelectorAll(".repo");


repos.forEach((repo) => {
  let checkbox = repo.querySelector(".top-margin input[type=checkbox]");
  let inputs = repo.querySelectorAll(".top-margin input[type=text]");

  checkbox.addEventListener( 'change', function() {
    if(checkbox.checked) {
        inputs.forEach((input) => {
          input.classList.add("input-show");
        })
    } else {
        inputs.forEach((input) => {
          input.classList.remove("input-show");
        })
    }
  })
})

