//= require rails-ujs
//= require_tree .
//= require jquery
//= require jquery.slick
//= require slick.js


document.addEventListener('DOMContentLoaded', function(){
  if (document.querySelector(".my-watchlists-line-wrapper")) {
    slick();
  }
  if (document.querySelector(".friends-line-wrapper")) {
    slickFriends();
  }
  if (document.querySelector(".followed-watchlists-line-wrapper")) {
    slickFollowed();
  }
  if (document.querySelector(".movies-line-wrapper")) {
    slickMovies();
  }
})

