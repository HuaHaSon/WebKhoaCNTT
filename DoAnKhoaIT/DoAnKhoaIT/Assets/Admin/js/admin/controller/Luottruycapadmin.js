var luottruycap = {
    init: function () {
        luottruycap.RegisterEvents()
    },
    RegisterEvents: function () {
        // do logic here
        var dulieu = [];
        $(document).ready(function () {
            $.ajax({
                url: "/Admin/Luottruycap/Luottruycap",
                type: "POST",
                dataType: "json",
                success: function (response) {
                    var res = JSON.parse(response.data);
                    $.each(res, function (i, v) {
                        //alert(v.NgayCT);
                        //alert(v.soluong);
                        dulieu.push({
                            x: v.ngay,
                            y: v.soluong + 100
                        });
                    });
                    GenerateChart(dulieu);
                }
            });
            function GenerateChart(dulieu) {
                alert("vao ham");
                var timeFormat = 'DD/MM/YYYY';
                var config = {
                    type: 'line',
                    data: {
                        datasets: [
                            {
                                label: "Lượt truy cập",
                                data: dulieu,
                                fill: false,
                                borderColor: 'blue'
                            }
                        ]
                    },
                    options: {
                        responsive: true,
                        title: {
                            display: true,
                            text: "Đồ thị lượt truy cập"
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
                                }
                            }]
                        }
                    }
                };
                var ctx = document.getElementById("myChart").getContext("2d");
                var chart1 = new Chart(ctx, config);
            }

        });

        var chonngay = "";
        // when the dialog is closed....
        $('.dropdown').on('hide.bs.dropdown', function (e) {
            if (chonngay == "tuychinh") {
                e.preventDefault();
            }
        });

        var start = moment().subtract(29, 'days');
        var end = moment();

        function cb(start, end) {
            $('#reportrange span').html(start.format('DD/MM/YYYY') + ' - ' + end.format('DD/MM/YYYY'));
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

        $('#reportrange > span').on('DOMSubtreeModified', function () {
            var list = $(this).text();
            alert(start);
            alert(end);
        })

    }
}
luottruycap.init();