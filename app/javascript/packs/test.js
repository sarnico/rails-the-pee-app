import { Calendar } from '@fullcalendar/core';
import resourceTimeGridPlugin from '@fullcalendar/resource-timegrid';
import interactionPlugin from '@fullcalendar/interaction';


const calendar = () => {

  document.addEventListener('DOMContentLoaded', function() {

    var calendarEl = document.getElementById('calendar');
    if (!calendarEl){
      return
    }
    const toiletSettings = JSON.parse(document
      .getElementById("booking-settings")
      .dataset
      .toiletSettings
    );

    const calendarData = JSON.parse(calendarEl.dataset.booking)

    let calendar = new Calendar(calendarEl, {
      height: 650,
      plugins: [ interactionPlugin, resourceTimeGridPlugin ],
      defaultView: 'timeGridDay',
      allDaySlot: false,
      selectable: true,
      slotDuration: '00:15',
      slotLabelInterval: '00:15',
      minTime: toiletSettings.min_booking_time,
      maxTime: toiletSettings.max_booking_time,
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
