import { Calendar } from '@fullcalendar/core';
import resourceTimeGridPlugin from '@fullcalendar/resource-timegrid';
import interactionPlugin from '@fullcalendar/interaction';


const calendar = () => {

  document.addEventListener('DOMContentLoaded', function() {

    var calendarEl = document.getElementById('calendar');
    const calendarData = JSON.parse(calendarEl.dataset.booking)
    console.log(calendarData)

    let calendar = new Calendar(calendarEl, {
      timeZone: 'local',
      plugins: [ interactionPlugin, resourceTimeGridPlugin ],
      defaultView: 'timeGridDay',
      selectable: true,
      slotDuration: '00:15',
      minTime: '08:00',
      maxTime: '17:00',
      events: calendarData
    })

    calendar.render();
  });
}

export { calendar }


// const calendar = () => {

//   document.addEventListener('DOMContentLoaded', function() {
//     var calendarEl = document.getElementById('calendar');

//     let calendar = new Calendar(calendarEl, {
//       timeZone: 'local',
//       plugins: [ resourceTimeGridPlugin ],
//       defaultView: 'resourceTimeGridDay',
//       events: `/toilets/${calendarEl.dataset.toiletId}/events.json`,

//       resources: [

//       ],
//       eventRender: function(info) {
//         debugger
//       }
//     })
//     calendar.render();

//   });
// }

// export { calendar }
