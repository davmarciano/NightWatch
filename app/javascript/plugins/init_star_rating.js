import "jquery-bar-rating";
import "jquery-bar-rating/dist/themes/css-stars.css";
import $ from 'jquery'; // <-- if you're NOT using a Le Wagon template (cf jQuery section)

const initStarRating = () => {
  console.log("HI")
  $('#watchlist_movie_rating').barrating({
    theme: 'css-stars'
  });
  console.log("HI")
  $('#review_rating').barrating({
    theme: 'css-stars'
  });
};

export { initStarRating };



