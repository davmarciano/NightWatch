//= require rails-ujs
//= require_tree .
//= require jquery
//= require jquery.slick
//= require slick.js
if (document.URL.match('watchlists')) {
slickFollowed();
slick();
} else if (document.URL.match('movies')) {
  slickMovies();
} else if (!document.URL.match(/movies\/\d+/)) {
  slick();
  slickFriends ();
  slickMovies();
}



