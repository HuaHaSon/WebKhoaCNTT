Thongketruycap = {
    init: function (){
        Thongketruycap.RegisterEvents()
    },
    RegisterEvents: function () {
        // bieu do
        var chart1;
        var soluong;
        GenerateChart();
        // do logic here
        var start = moment().subtract(29, 'days');
        var end = moment();

        function cb(start, end) {
            $('#reportrange span').html(start.format('DD/MM/YYYY') + ' - ' + end.format('DD/MM/YYYY'));
            $.ajax({
                url: "/Admin/Thongkebaidang/loadbaidang",
                type: "POST",
                data: { startdate: start.format('MM/DD/YYYY'), enddate: end.format('MM/DD/YYYY') },
                dataType: "json",
                success: function (response) {
                    var dulieu = [];
                    var res = JSON.parse(response.baidang);
                    var tong = 0;
                    $.each(res, function (i, v) {
                        tong = tong + v.soluong;
                        dulieu.push({
                            x: v.ngay,
                            y: v.soluong
                        });
                    });
                    soluong = tong;
                    chart1.config.data.datasets[0].data = dulieu;
                    chart1.update();
                    $("#baidang").text(soluong);                   
                }
            });
        };

        $('#reportrange').daterangepicker({
            startDate: start,
            endDate: end,
            ranges: {
                'Hôm nay': [moment(), moment()],
                '7 ngày qua': [moment().subtract(7, 'days'), moment()],
                '28 ngày qua': [moment().subtract(28, 'days'), moment()],
                '60 ngày qua': [moment().subtract(60, 'days'), moment()],
                'Tháng này': [moment().startOf('month'), moment().endOf('month')],
                'Tháng trước': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
            },
            locale: {
                "customRangeLabel": "Tùy chỉnh",
                "applyLabel": "Chọn",
                "cancelLabel": "Hủy",
            }
        }, cb);

        cb(start, end);

        // bieu do

        function GenerateChart() {
            var timeFormat = 'DD/MM/YYYY';
            var config = {
                type: 'line',
                data: {
                    datasets: [
                        {
                            label: "Lượt truy cập",
                            data: [],
                            fill: true,
                            borderColor: 'blue',
                            fillColor: "rgba(151,187,205,0.2)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(151,187,205,1)",
                            pointRadius: 1
                        }
                    ]
                },
                options: {

                    responsive: true,
                    title: {
                        display: true,
                        text: "Đồ thị lượt truy cập"
                    },
                    legend: {
                        display: true,
                        reverse: true
                    },
                    tooltips: {
                        mode: 'index',
                        intersect: false,
                    },
                    hover: {
                        mode: 'nearest',
                        intersect: true
                    },
                    scales: {
                        xAxes: [{
                            type: "time",

                            time: {
                                format: timeFormat,
                                displayFormats: {
                                    millisecond: 'h:mm:ss.SSS a',
                                    second: 'DD/MM',
                                    minute: 'DD/MM',
                                    hour: 'hA',
                                    day: 'DD/MM',
                                    week: 'll',
                                    month: 'MM/YYYY',
                                    quarter: '[Q]Q - YYYY',
                                    year: 'YYYY'
                                },
                            },
                            scaleLabel: {
                                display: true,
                                labelString: 'Thời gian'
                            }
                        }],
                        yAxes: [{
                            scaleLabel: {
                                display: true,
                                labelString: 'Lượt truy cập'
                            },
                            ticks: {
                                beginAtZero: true
                            },
                        }],
                    }
                }
            };
            var ctx = document.getElementById("myChart").getContext("2d");
            chart1 = new Chart(ctx, config);
        };

        $("#myChart").click(function (e) {
            alert("click");
        });
        document.getElementById("myChart").onmousemove = function (evt) {
            mousemovechart(chart1, evt);
        };

        $("#myChart").mouseleave(function () {
            $("#baidang").text(soluong);           
        });

        function mousemovechart(chart1, evt) {
            var offset = $("#myChart").offset();
            var a = Math.round(evt.pageX - offset.left);

            var x = -1;
            var meta = chart1.getDatasetMeta(0);

            // tim kiem nhi phan
            var left = 0;
            var right = meta.data.length - 1;

            while (left <= right) {

                var mid = Math.round((left + right) / 2);
                var t = Math.round(meta.data[mid]._model.x);
                if (a == t) {
                    x = mid;
                    break;
                }
                else if (a < t)
                    right = mid - 1;
                else if (a > t)
                    left = mid + 1;
            }
            if (x != -1) {
                $("#baidang").text(chart1.config.data.datasets[0].data[x].y);
            }
        };
    }
}
Thongketruycap.init();