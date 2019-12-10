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



if (document.querySelector(".my-watchlists-line-wrapper")) {
  slick();
  console.log(88888)
} else if (document.querySelector(".friends-line-wrapper")) {
  slickFriends();
} else if (document.querySelector(".followed-watchlists-line-wrapper")) {
  slickFollowed();
} else if (document.querySelector(".movies-line-wrapper")) {
  slickMovies();
}


