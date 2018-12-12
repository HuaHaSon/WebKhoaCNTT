

// Marker Map


$(document).ready(function () {
    map = new GMaps({
        el: '#markermap',
        lat: 10.759567,
        lng: 106.682140,
        panControl: true,
        streetViewControl: true,
        mapTypeControl: true,
        overviewMapControl: true

    });
    map.addMarker({
        lat: 10.759567,
        lng: 106.682140,
        title: 'Bản đồ',
        infoWindow: {
            content: '<p>Đại học Sài Gòn</p>'
        }
    });
});








