

import 'dart:async';

import 'package:fluster/fluster.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class UserLocation {
  final double latitude;
  final double longitude;

  UserLocation({this.latitude, this.longitude});
}

class LocationService {

  Position currentLocation;
  Completer<GoogleMapController> googleMapContrroller = Completer();



  // Keep track of current Location
  // UserLocation _currentLocation;
  // Location location = Location();
  // Continuously emit location updates
  // StreamController<UserLocation> _locationController = StreamController<UserLocation>.broadcast();

  // LocationService() {
  //   location.requestPermission().then((granted) {
  //     if (granted != null) {
  //       location.onLocationChanged.listen((locationData) {
  //         if (locationData != null) {
  //           _locationController.add(UserLocation(
  //             latitude: locationData.latitude,
  //             longitude: locationData.longitude,
  //           ));
  //         }
  //       });
  //     }
  //   });
  // }

  // Stream<UserLocation> get locationStream => _locationController.stream;

  // Future<UserLocation> getLocation() async {
  //   try {
  //     var userLocation = await location.getLocation();
  //     _currentLocation = UserLocation(
  //       latitude: userLocation.latitude,
  //       longitude: userLocation.longitude,
  //     );
  //   } catch (e) {
  //     print('Could not get the location: $e');
  //   }
  //
  //   return _currentLocation;
  // }


  /// GeoLocator
  // Position currentPosition = Position();
  // StreamController<Position> _locationControllerForPosition = StreamController<Position>();
  // Stream<Position> get locationStream2 => _locationControllerForPosition.stream;

  // Future<Position> getPosition() async {
  //   // Request permission to use location
  //   location.requestPermission().then((granted) {
  //     if (granted != null) {
  //       // If granted listen to the onLocationChanged stream and emit over our controller
  //       location.onLocationChanged.listen((locationData) {
  //         if (locationData != null) {
  //           _locationControllerForPosition.add(currentPosition);
  //         }
  //       });
  //     }
  //   });
  //
  //   try {
  //     currentPosition = await getPosition();
  //   } on Exception catch (e) {
  //     print('Could not get location: ${e.toString()}');
  //   }
  //
  //   return currentPosition;
  // }


  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permantly denied, we cannot request permissions.');
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return Future.error(
            'Location permissions are denied (actual value: $permission).');
      }
    }

    return await Geolocator.getCurrentPosition();
  }

  getPosition() async {

    currentLocation = await _determinePosition();
    print('getPosition ${currentLocation}');

  }

}

class MapMarker extends Clusterable {
  final String id;
  final LatLng position;

  MapMarker({
    @required this.id,
    @required this.position,
    isCluster = false,
    clusterId,
    pointsSize,
    childMarkerId,
  }) : super(
    markerId: id,
    latitude: position.latitude,
    longitude: position.longitude,
    isCluster: isCluster,
    clusterId: clusterId,
    pointsSize: pointsSize,
    childMarkerId: childMarkerId,
  );

  Marker toMarker() => Marker(
    markerId: MarkerId(id),
    position: LatLng(
      position.latitude,
      position.longitude,
    ),
    icon: BitmapDescriptor.defaultMarker,
  );
}
