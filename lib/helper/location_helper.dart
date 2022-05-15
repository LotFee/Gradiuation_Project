const Google_Api_Key='AIzaSyAFvnCQIRcpm0bE7vXUXoehfnkptxuMOXI';

class LocationHelper{
  static String generateLocationImage({required double latitude,required double longitude}){
    String s= 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:blue%7Clabel:S%7C$latitude,$longitude&markers=color:green%7Clabel:G%7C$latitude,$longitude&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=AIzaSyAFvnCQIRcpm0bE7vXUXoehfnkptxuMOXI';
    return s;
     // 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$Google_Api_Key';
  }
}