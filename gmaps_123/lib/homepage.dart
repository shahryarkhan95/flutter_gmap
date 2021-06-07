import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  Completer<GoogleMapController> _controller = Completer();

  @override
  //INSERT
  void initState() {
    super.initState();
  }

  double zoomVal = 5.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              //
            }),
        title: Text("Lahore"),
        actions: <Widget>[
          IconButton(
              icon: Icon(FontAwesomeIcons.search),
              onPressed: () {
                //
              }),
        ],
      ),

      //STACK WIDGET USED
      body: Stack(
        // ALL COMEPONENTS SEPERATED INTO WIDGETS HERE

        children: <Widget>[
          _googlemap(context),
          // _zoomminusfunction(),
          // _zoomplusfunction(),
          _buildContainer( ),
        ],
      ),
    );
  }

// CONTAINER FOR LIST VIEW

Widget _buildContainer() {  
  return Align(
    alignment: Alignment.bottomleft,
    child: Container(
      margin: EdgeInsets.symmetric(vertical:20.0),
      height:150.0,
      
      //LIST VIEW ADDED HERE
      child:listView(

      ),
    ),
  );
}


  Widget _googlemMap(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: GoogleMap(
            mapType: MapType.normal,
            //LOCATION OF GOOGLE MAPS ON INITIAL LOAD
            //LONG LAT ARFA KARIM TOWER
            initialCameraPosition:
                CameraPosition(target: LatLng(31.4756, 74.3424), zoom: 12),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            }));
  }
}
 //8