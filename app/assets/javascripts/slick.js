function slick() {
  const count = parseInt(document.querySelector(".my-watchlists-line-wrapper").dataset.watchlistCount, 10)
  let slides;
  if (count >= 3) {
    slides = 3
  } else if (count === 2) {
    slides = 2
  } else {
    slides = 1
  }
  $('.my-watchlists-line-wrapper').slick({
    infinite: true,
    slidesToShow: slides,
    slidesToScroll: slides,
    dots: true
  });
};


function slickFollowed() {

  const count = parseInt(document.querySelector(".followed-watchlists-line-wrapper").dataset.watchlistCount, 10)
  let slides;
  if (count >= 3) {
    slides = 3
  } else if (count === 2) {
    slides = 2
  } else {
    slides = 1
  }

  $('.followed-watchlists-line-wrapper').slick({
    infinite: true,
    slidesToShow: slides,
    slidesToScroll: slides,
    dots: true
  });
};

//export { slick };

function slickFriends() {

  const count = parseInt(document.querySelector(".friends-line-wrapper").dataset.friendsCount, 10)
  let slides;
  if (count >= 3) {
    slides = 3
  } else if (count === 2) {
    slides = 2
  } else {
    slides = 1
  }

  $('.friends-wrapper').slick({
    infinite: true,
    slidesToShow: slides,
    slidesToScroll: slides,
    dots: true
  });
};
