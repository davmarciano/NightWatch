//= require rails-ujs
//= require_tree .
//= require jquery
//= require jquery.slick
//= require slick.js


// if (document.URL.match('watchlists')) {
// slickFollowed();
// slick();
// } else if (document.URL.match('movies')) {
//   slickMovies();
// } else if (!document.URL.match(/movies\/\d+/)) {
//   slick();
//   slickFriends ();
//   slickMovies();
// }

document.addEventListener('DOMContentLoaded', function(){
  if (document.querySelector(".my-watchlists-line-wrapper")) {
    slick();
  }
  if (document.querySelector(".friends-line-wrapper")) {
    slickFriends();
  }
  if (document.querySelector(".followed-watchlists-line-wrapper")) {
    slickFollowed();
    console.log(8888);
  }
  if (document.querySelector(".movies-line-wrapper")) {
    slickMovies();
  }
})

