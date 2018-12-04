var home = {
    init: function () {
        home.RegisterEvents()
    },
    RegisterEvents: function () {
        $(document).ready(function () {
            $.ajax({
                url: "/Admin/Home/loadlichGV",
                dataType: "json",
                type: "Post",
                data: { status: '1' },
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
                    $.ajax({
                        url: '/Admin/Home/LoadchitietCongtacgiaovien',
                        dataType: 'json',
                        type: 'POST',
                        data: { id: event.title },
                        success: function (response) {
                            $("#tieude").text(response.congtac.mactct);
                            $("#ngayct").text(response.congtac.ngayct);
                            document.getElementById("diadiem").innerHTML = "<strong> Địa điểm: </strong>" + response.congtac.diadiem;
                            document.getElementById("chutri").innerHTML = "<strong> Chủ trì: </strong> " + response.congtac.chutri;
                            document.getElementById("noidung").innerHTML = response.congtac.noidung;
                            document.getElementById("thanhphan").innerHTML = response.congtac.thanhphan;
                        }
                    })
                    $("#lichgvmodal").modal('show');
                    event.color = "black";
                    $('#calendar').fullCalendar('updateEvent', event);

                },

                //dayClick: function (date, jsEvent, view) {

                //    alert('Clicked on: ' + date.format());

                //    alert('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);

                //    alert('Current view: ' + view.name);

                //    //change the day's background color just for fun
                //    $(this).css('background-color', 'red');
                //}

            });
        };
        $(".nghiencuu").click(function (e) {
            $.ajax({
                url: '/Admin/Home/loadchitietkhoahoc',
                dataType: 'json',
                type: 'POST',
                data: { id: $(this).data("mactnckh") },
                success: function (response) {
                    $("#tieudekhoahoc").text(response.khoahoc.tieude);
                    $("#ngaykhoahoc").text(response.khoahoc.ngaykh);
                    document.getElementById("noidungkhoahoc").innerHTML = response.khoahoc.noidung;
                }
            });
            $("#khoahocmodal").modal("show");
        });
        $("#reportrange > span").on(change, function (e) {
            alert($(this).text);
        });
        $("#")
    }
}
home.init();

