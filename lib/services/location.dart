import 'package:geolocator/geolocator.dart';
class Location{
  double latitude;
  double longitude;



  Future<void> getLocation() async
  {
    try{
      Position position = await Geolocator().getLastKnownPosition(desiredAccuracy: LocationAccuracy.low);
      print(position);
      latitude=position.latitude;
      longitude=position.longitude;
    }
    catch(e){
      print(e);
    }
  }

}