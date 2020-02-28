const inputSearch = () => {


  let mapSearch = document.querySelector('.mapboxgl-ctrl-geocoder--input');

  mapSearch.addEventListener('keyup', (event) => {
    if (event.keyCode == 13) {
      const test = event.currentTarget.value
      console.log(test)

    };
      // sendEvent.preventDefault();
      // console.log(mapSearch.innerText);
  });



}


export { inputSearch }
