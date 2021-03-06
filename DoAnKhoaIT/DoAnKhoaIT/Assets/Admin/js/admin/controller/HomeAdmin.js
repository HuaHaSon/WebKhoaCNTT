﻿$(document).ready(function () {
    $.ajax({
        url: "/Admin/Home/loadlichGV",
        dataType: "json",
        type: "Post",
        data: {status: '1'},
        success: function (response) {
            
            var res = JSON.parse(response.data);
            var events = [];
            $.each(res, function (i, v) {
                //alert(v.NgayCT);
                events.push({
                    title: v.MaCTCTGV,
                    start: v.NgayCT,
                });     
            });                    

            GenerateCalendar(events);
            
        }
    });
});
function GenerateCalendar(events) {
    $("#calendar").fullCalendar('destroy');
    $('#calendar').fullCalendar({


        header: { left: 'month,list', center: 'title', right: 'today prevYear,prev,next,nextYear' }, // buttons for switching between views
        buttonText: {
            today: 'Hôm nay',
            month: 'Tháng',
            week: 'Tuần',
            day: 'Ngày',
            list: 'Danh sách'
        },
        views: {
            month: { // name of view
                titleFormat: 'YYYY/MM/DD',

                //other view - specific options here
            }
        },
        events: events,                   

        eventClick: function (event, element) {
            alert("thanh cong");
            alert(event.title);
            $("#lichgvmodal").modal('show');
            event.color = "black";
            $('#calendar').fullCalendar('updateEvent', event);

        },

        dayClick: function (date, jsEvent, view) {

            alert('Clicked on: ' + date.format());

            alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

            alert('Current view: ' + view.name);

            //change the day's background color just for fun
            $(this).css('background-color', 'red');
        }

    });
};
//$('#calendar').fullCalendar({


//    header: { center: 'month,list', right: 'today prevYear,prev,next,nextYear' }, // buttons for switching between views
//    buttonText: {
//        today: 'Hôm nay',
//        month: 'Tháng',
//        week: 'Tuần',
//        day: 'Ngày',
//        list: 'Danh sách'
//    },
//    views: {
//        month: { // name of view
//            titleFormat: 'YYYY/MM/DD',
            
//             other view-specific options here
//        }
//    },
//    events: [
//        {
//            id:1,
//            title: 'Event Title1',
//            start: '2018-12-01T13:13:55.008',
//            end: '2018-12-19T13:13:55.008',
//            editable: false,
//            color:'#378006'
            
//        },
//        {
//            id:2,
//            title: 'Event Title2',
//            start: '2018-12-04T13:13:55.008',
//            end: '2018-12-15T13:13:55.008',
//            editable: false
           
//        }
//    ],

//    eventClick: function (event, element) {

//        event.title = "CLICKED!";
//        event.end = '2018-12-05T13:13:55.008'
//        $('#calendar').fullCalendar('updateEvent', event);

//    },

//    dayClick: function (date, jsEvent, view) {

//        alert('Clicked on: ' + date.format());

//        alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

//        alert('Current view: ' + view.name);

//         change the day's background color just for fun
//        $(this).css('background-color', 'red');
//    }
    
//});
