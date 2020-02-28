function show_prompt() {
  document.querySelector(".submit-booking").addEventListener("click", (event) => {
    // event.preventDefault();
    const name = alert('Your booking has been taken in account');
    window.location.href = "https://thepeeapp.herokuapp.com/"
  });
}



// const name = alert('Your booking has been taken in account');


export { show_prompt }
