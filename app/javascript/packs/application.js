import "bootstrap";

//StartRating
import { initStarRating } from '../plugins/init_star_rating';

initStarRating();


//Select2
import 'select2/dist/css/select2.css';

import { initSelect2 } from '../plugins/init_select2';

initSelect2();


// Sweetalert
import { initSweetalert } from '../plugins/init_sweetalert';
import { addMovieSubmission } from '../modules/addMovieSubmission';
import { createWatchlistSubmission } from '../modules/createWatchlistSubmission';

// addMovieSubmission();


// initSweetalert('#sweet-alert-demo', {
//   title: "Your movie has been added",
//   text: "You will be redirected shortly",
//   icon: "success"
// });



