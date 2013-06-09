$(function() {
  initialiseMap();
  initialise();

function initialiseMap()
{
    var myOptions = {
        zoom: 4,
        mapTypeControl: true,
        mapTypeControlOptions: {style: google.maps.MapTypeControlStyle.DROPDOWN_MENU},
        navigationControl: true,
        navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL},
        mapTypeId: google.maps.MapTypeId.ROADMAP      
      }	
  map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
}
function initialise()
{
  if(geoPosition.init())
  {
    document.getElementById('current').innerHTML="Receiving...";
    geoPosition.getCurrentPosition(showPosition,function(){document.getElementById('current').innerHTML="Couldn't get location"},{enableHighAccuracy:true});
  }
  else
  {
    document.getElementById('current').innerHTML="Functionality not available";
  }
}

function showPosition(p)
{
  var latitude = parseFloat( p.coords.latitude );
  var longitude = parseFloat( p.coords.longitude );
  $('#incident_report_latitude').val(latitude);
  $('#incident_report_longitude').val(longitude);
  var pos=new google.maps.LatLng( latitude , longitude);
  map.setCenter(pos);
  map.setZoom(14);
  document.getElementById('current').innerHTML="";

  var infowindow = new google.maps.InfoWindow({
      content: "<strong>yes</strong>"
  });

  var marker = new google.maps.Marker({
      position: pos,
      map: map,
      title:"You are here"
  });

  google.maps.event.addListener(marker, 'click', function() {
    infowindow.open(map,marker);
  });

}
});
