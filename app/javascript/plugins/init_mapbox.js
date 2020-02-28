import mapboxgl from 'mapbox-gl';
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into

    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey


    // Create the map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10',
      zoom: 10
    });


    // ADD Coordinates of current position
    navigator.geolocation.getCurrentPosition((res) => {
      const popup = new mapboxgl.Popup({ closeOnClic: false }, { closeOnMove: true }, { className: popup } ).setHTML("<h3><font size='-1'>You are here</font></h3>");
      new mapboxgl.Marker({ color: '#FF0100' })
        .setLngLat([ res.coords.longitude, res.coords.latitude ])
        .setPopup(popup)
        .addTo(map);

      const bounds = new mapboxgl.LngLatBounds();
      bounds.extend([ res.coords.longitude, res.coords.latitude ]);
      map.fitBounds(bounds, { padding: 70, maxZoom: 14, duration: 10 });
    })


    // Parse the HTML tag and get the markers of toilets
    const markers = JSON.parse(mapElement.dataset.markers);

    // Add popup on markers
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(map);
    });

    // Add Navigatioon control on the map
    map.addControl(new mapboxgl.NavigationControl(), 'top-left');



    map.on('click', function(e) {
      const coordinates = [e.lngLat.lng, e.lngLat.lat]
      map.flyTo({
        center: coordinates,
        zoom: 14
      });
    });


    map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, placeholder: 'Search',
                                      mapboxgl: mapboxgl }));
  }
};

export { initMapbox };
