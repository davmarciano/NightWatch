function slickItem() {
  var count = parseInt(document.querySelector(".my-watchlists-line-wrapper").dataset.watchlistCount, 10)
  // let slides;
  // if (count >= 3) {
  //   slides = 3
  // } else if (count === 2) {
  //   slides = 2
  // } else {
  //   slides = 1
  // }
  $('.my-watchlists-line-wrapper').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3,
    dots: true
  });
};


function slickFollowed() {

  var count = parseInt(document.querySelector(".followed-watchlists-line-wrapper").dataset.watchlistCount, 10)
  $('.followed-watchlists-line-wrapper').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3,
    dots: 3
  });
};


function slickFriends() {

  var count = parseInt(document.querySelector(".friends-line-wrapper").dataset.friendsCount, 10)
  var slides;
  if (count >= 10) {
    slides = 10
  } else if (count === 9) {
    slides = 9
  } else if (count === 8) {
    slides = 8
  } else if (count === 7) {
    slides = 7
  } else if (count === 6) {
    slides = 6
  } else if (count === 5) {
    slides = 5
  } else if (count === 4) {
    slides = 4
  } else if (count === 3) {
    slides = 3
  } else if (count === 2) {
    slides = 2
  } else {
    slides = 1
  }

  $('.friends-line-wrapper').slick({
    infinite: true,
    slidesToShow: slides,
    slidesToScroll: slides,
    dots: true
  });
};

function slickMovies() {
  var count = parseInt(document.querySelector(".movies-line-wrapper").dataset.moviesCount, 10)
  $('.movies-line-wrapper').slick({
    infinite: true,
    slidesToShow: 5,
    slidesToScroll: 5,
    dots: true,
  });
};

