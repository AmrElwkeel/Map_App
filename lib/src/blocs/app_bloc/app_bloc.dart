import 'package:app_map/src/models/place_search.dart';
import 'package:app_map/src/services/geolocator.dart';
import 'package:app_map/src/services/places_servcies.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';





class ApplicationBloc with ChangeNotifier{


 final geoLocatorServices = GeolocatorServices();
 final placesServices = PlacesService();

 Position? currentLocation ;


  ApplicationBloc(){
   setCurrentLocation();
  }

 List<PlaceSearch>? searchResult =[] ;
 setCurrentLocation()async{
    currentLocation = await geoLocatorServices.getCurrentLocation();
    notifyListeners();
 }

  searchPlaces(String searchTerm)async{
     searchResult = await placesServices.getAutoComplete(searchTerm);
     notifyListeners();
  }

}











