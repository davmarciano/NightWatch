import swal from 'sweetalert';

const addMovieSubmission = () => {
  console.log('TRIGGERED')
const options = {
  title: "Your movie has been added",
  text: "You will be redirected shortly",
  icon: "success",
  timer: 2000,
  buttons: false

}
  swal(options);

}

window.addMovieSubmission = addMovieSubmission
export { addMovieSubmission }
