import 'package:geolocator/geolocator.dart';

class LocationService {
 static Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permision;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error("Location service is not enabled");
    }

    permision = await Geolocator.checkPermission();

    if (permision == LocationPermission.denied) {
      permision == await Geolocator.requestPermission();

      if (permision == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    if (permision == LocationPermission.deniedForever) {
      return Future.error("Location permission are permently denied");
    }

    Position position = await Geolocator.getCurrentPosition();
    print('hi');
    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    return position;
  }
}

