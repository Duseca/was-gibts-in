import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:was_gibts_in/constants/url.dart';
import 'package:was_gibts_in/data/response/api_response.dart';
import 'package:was_gibts_in/respository/weather_repository.dart';

class LocationController extends GetxController {
 bool isLoading=false;
 changeLoading(l){
  isLoading = l;
  update();
 }
  Uint8List? resizedMarkerImageBytes;
  changeMarker(image) {
    resizedMarkerImageBytes = image;
    update();
  }
  bool isLoaded = true;
  List<DocumentSnapshot> fullData =[];
 
 addFullData(data){
  fullData = data;
 }
 
  String filterType= '';
  var cityName;
  var description;
  var temp;
  var feels_like;
  var latitude;
  var longitude;
  String anotherLocation = '';
  List<Placemark> placemarks = [];
  var i = 0;
  Completer<GoogleMapController> googleMapController = Completer();

  changeLatLng(lat, lng, index) {
    latitude = latitude;
    longitude = lng;
    i = index;
    update();
  }
  ApiResponse loadStatus = ApiResponse.loading();

  setLoadStatus(ApiResponse response) {
    loadStatus = response;
    update();
  }

  WeatherRepository repo = WeatherRepository();
  
  // getCurrent weather location
  Future getCurrentWeather(lat , lng) async {
    placemarks = await placemarkFromCoordinates(
        lat.toDouble(), lng.toDouble());
         cityName = placemarks.last.locality.toString();
    String url =
        "$weatherUrl?lat=$lat&lon=$lng&appid=$apiKey&units=metric";
    repo.getWeatherApiRepo(url).then((value) {
      var data = value;
      print("data: $data");
      description = data['weather'][0]['description'];
      temp = data['main']['temp'];
      feels_like = data['main']['feels_like'];
     
      update();
      setLoadStatus(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      print("my Error ${error.toString()}");
      setLoadStatus(ApiResponse.error(error.toString()));
    });
  }

    // changeLocation
    changeLocation(lat,lng) async {
    await getCurrentWeather(lat,lng);
    GoogleMapController con = await googleMapController.future;
    con.animateCamera(await CameraUpdate.newCameraPosition(
    CameraPosition(zoom: 14.4746, target: LatLng(latitude, longitude))));
    update();
  }

}
