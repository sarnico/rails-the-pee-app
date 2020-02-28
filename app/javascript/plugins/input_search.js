const inputSearch = () => {


  let mapSearch = document.querySelector('.mapboxgl-ctrl-geocoder--input');

  if ((mapSearch)) {
    mapSearch.addEventListener('keyup', (event) => {
      if (event.keyCode == 13) {
        const test = event.currentTarget.value
        console.log(test)

        fetch('near_toilets?location_query=' + test)
          .then(response => response.json())
          .then(json => {
            const allToilets = document.querySelector(".all-toilets")
            allToilets.innerHTML = ""
            json.forEach(entry => {
              allToilets.innerHTML += entry.partial
            })
          })
      };
    });
  }



}


export { inputSearch }
