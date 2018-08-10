const repos = document.querySelectorAll(".repo");


repos.forEach((repo) => {
  let checkbox = repo.querySelector(".first-repo-wraper input[type=checkbox]");
  let inputs = repo.querySelectorAll(".first-input-hiden");

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

