function show_prompt() {
  const ois = document.querySelector(".submit-booking")
  if(ois){
    ois.addEventListener("click", (event) => {
      // event.preventDefault();
      const name = alert('Your booking has been taken in account');
      window.location.href = "https://thepeeapp.herokuapp.com/"
    });
  }
}



// const name = alert('Your booking has been taken in account');


export { show_prompt }
