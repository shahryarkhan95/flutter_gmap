import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
          _googleMap(context),
          // _zoomminusfunction(),
          // _zoomplusfunction(),
          _buildContainer(),
        ],
      ),
    );
  }

// CONTAINER FOR LIST VIEW

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,

        //LIST VIEW ADDED HERE
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SizedBox(width: 10.0),

            //FITTED BOX

            //BOX 1
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/swim.jpg", 31.4756, 74.3424,
                  "Lahore 1 Swimming Pool"),
            ),

            SizedBox(width: 10.0),
//BOX 2
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/swim2.jpg", 31.4756, 74.3424,
                  "Lahore 2 Swimming Pool"),
            ),

            SizedBox(width: 10.0),
//BOX 3
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _boxes("assets/swim3.jpg", 31.4756, 74.3424,
                  "Lahore 3 Swimming Pool"),
            ),
          ],
        ),
      ),
    );
  }

// StyledBox(width:10.0),
//   TextButton(
//   style: ButtonStyle(
//     foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
//   ),
//   onPressed: () { },
//   child: Text('Confirm Location'),

  Widget _boxes(String _image, double lat, double long, String resutantName) {
    return GestureDetector(
      onTap: () {
        //GOES TO LOCATION ON MAP ON TAP
        _gotolocation(lat, long);
      },
      child: Container(
          child: new FittedBox(
              child: Material(
        color: Colors.white,
        elevation: 14.0,
        borderRadius: BorderRadius.circular(24.0),

        shadowColor: Color(0x802196F3),
        child : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width:180,
                height:200,
                //clips own child
                child:ClipRRect(
                  borderRadius: new BorderRadius.circular(24.0),

                  child: Image(
                    fit:BoxFit.fill,
                    image: NetworkImage(_image),

                  ),
                  ),
            ),
            Container ( 
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                // child: myDetailsContainer(resutantName), ?
              ),
              ), 
          ]
        ), 


      ))),
    );
  }




  Widget _googleMap(BuildContext context) {
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