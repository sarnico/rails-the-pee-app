import { Calendar } from '@fullcalendar/core';
import resourceTimeGridPlugin from '@fullcalendar/resource-timegrid';

import dayGridPlugin from '@fullcalendar/daygrid';


const calendar = () => {

  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');

    let calendar = new Calendar(calendarEl, {
      plugins: [ resourceTimeGridPlugin ],
      defaultView: 'resourceTimeGridDay',
      resources: [
        // your list of resources
      ]
    });
    calendar.render();
  });
}

export { calendar }


