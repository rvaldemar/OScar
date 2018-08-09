const checkboxs = document.querySelectorAll(".top-margin input[type=checkbox]");

const inputs = document.querySelectorAll(".top-margin input[type=text]");


checkboxs.forEach((checkbox) => {
  checkbox.addEventListener( 'change', function() {
    if(this.checked) {
        // Checkbox is checked..
    } else {
        // Checkbox is not checked..
    }
  })
};
