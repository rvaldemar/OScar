import "bootstrap";

import 'packs/addfirstrepo';

import 'packs/destroy_repo';

const newPostButton = document.getElementById("btn-new-post");
const newPostCancelButton = document.getElementById("btn-new-post-cancel");
const newPostArea = document.getElementById("new-post");

newPostButton.addEventListener("click", function(){
  newPostArea.classList.add("active-new-post");
});

newPostCancelButton.addEventListener("click", function(){
  newPostArea.classList.remove("active-new-post");
});
