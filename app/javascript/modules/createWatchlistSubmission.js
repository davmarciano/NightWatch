import swal from 'sweetalert';

const createWatchlistSubmission = () => {
  console.log('TRIGGERED')
const options = {
  title: "Your watchlist has been created",
  text: "You will be redirected shortly",
  icon: "success",
  timer: 4000,
  buttons: false

}
  swal(options);

}

window.createWatchlistSubmission = createWatchlistSubmission
export { createWatchlistSubmission }
