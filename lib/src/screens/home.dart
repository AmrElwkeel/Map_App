import 'package:app_map/src/blocs/app_bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    final appBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
      body:  (appBloc.currentLocation == null)? const Center(child: CircularProgressIndicator(),)
          :ListView(
            children: <Widget>[
               Padding(
                padding:const EdgeInsets.all(8.0),
                child:  TextField(
                 decoration: const InputDecoration(
                   hintText: "Search Location",
                   suffixIcon:Icon(Icons.search),
            ),
                  onChanged: (value) => appBloc.searchPlaces(value),


          ),
              ),
           Stack(
             children: [
               Container(

                height:300 ,
                child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationEnabled: true,

                  initialCameraPosition: CameraPosition(
                      target:LatLng(
                          appBloc.currentLocation!.altitude,
                          appBloc.currentLocation!.longitude,
                      ),
                      zoom:5 ,
                  ),

                ),
          ),

               if (appBloc.searchResult != null && appBloc.searchResult?.length != 0)
               Container(
                 height: 300,
                 width: double.infinity,
                 decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.6),
                   backgroundBlendMode: BlendMode.darken,
                 ),
               ),
               if (appBloc.searchResult != null)
               Container(
                 height: 300,
                 child: ListView.builder(
                   itemCount: appBloc.searchResult?.length,
                     itemBuilder: (context,index){
                     return ListTile(
                       title: Text(appBloc.searchResult![index].description!,
                         style:const  TextStyle(
                           color: Colors.white,
                         ),

                       ),
                     );
                     },
                 ),
               ),
             ],
           ),
        ],
      ),
    );
  }

}

