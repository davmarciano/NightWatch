//= require rails-ujs
//= require_tree .
//= require jquery
//= require jquery.slick
//= require slick.js
if (document.URL.match('watchlists')) {
slickFollowed();
}

if (!document.URL.match(/movies\/\d+/)) {
  slick();
  slickFriends ();
  slickMovies();
}



