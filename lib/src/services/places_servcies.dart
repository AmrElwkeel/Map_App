import 'package:app_map/src/models/place_search.dart';
import 'package:http/http.dart'as http ;

import 'dart:convert' as convert;





class PlacesService{

  final String key = "";

   Future<List<PlaceSearch>> getAutoComplete(String search)async{

     var url = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=$key" ;

     var response = await http.get(Uri.parse(url));
     var json  = convert.jsonDecode(response.body);
     var placeId = json['predictions'][1]['place_id'] as String ;
     print(placeId);
     var jsonResult = json['predictions'] as List ;
     return jsonResult.map((place) => PlaceSearch.fromJson(place)).toList();
     

   }






}
