import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {  
  @override  
  _MyAppState createState() => _MyAppState();  
}  
  
class _MyAppState extends State<MyApp> {  
  late GoogleMapController myController;  
  
  static final LatLng _center = const LatLng(45.521563, -122.677433);  
  static final LatLng _center1 = const LatLng(12.971599, 77.594566);  

  LatLng _currentMapPosition = _center; 
  void _onMapTypeButtonPressed() {  
  setState(() {  
    _currentMapType = _currentMapType == MapType.normal  
        ? MapType.satellite  
        : MapType.normal;  
  });  
}  
  void _onMapCreated(GoogleMapController controller) {  
    myController = controller;  
  }  
  MapType _currentMapType = MapType.normal; 
  final Set<Marker> _markers = {};
    final Set<Marker> _markers1 = {}; 

   
  
void _onCameraMove(CameraPosition position) {  
  _currentMapPosition = position.target;  
}  


 void _onAddMarkerButtonPressed() {  
    setState(() {  
      _markers.add(Marker(  
        markerId: MarkerId(_currentMapPosition.toString()),  
        position: _currentMapPosition,  
        infoWindow: InfoWindow(  
          title: 'Nice Place',  
          snippet: 'Welcome to Poland'  
        ),  
        icon: BitmapDescriptor.defaultMarker,  
      ));  
       _markers1.add(Marker(  
        markerId: MarkerId(_currentMapPosition.toString()),  
        position: _currentMapPosition,  
        infoWindow: InfoWindow(  
          title: 'Nice Place',  
          snippet: 'Welcome to Poland'  
        ),  
        icon: BitmapDescriptor.defaultMarker,  
      ));  
    });  
  }  


  

  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: Scaffold(  
        appBar: AppBar(  
          title: Text('Flutter Maps Demo'),  
          backgroundColor: Colors.green,  
        ),  
        body: Stack(  
          children: <Widget>[  
            Column(
              children: [
                Expanded(
                  child: GoogleMap(  
                    onCameraMove: _onCameraMove,
                    markers: _markers,
                     mapType: _currentMapType, 
                    onMapCreated: _onMapCreated,  
                    initialCameraPosition: CameraPosition(  
                      target: _center,  
                      zoom: 10.0,  
                    ),  
                  ),
                ),
                Divider(),
                Expanded(
                  child: GoogleMap(  
                    onCameraMove: _onCameraMove,
                    markers: _markers1,
                     mapType: _currentMapType, 
                    onMapCreated: _onMapCreated,  
                    initialCameraPosition: CameraPosition(  
                      target: _center1,  
                      zoom: 10.0,  
                    ),  
                  ),
                ),
              ],
            ),  
            Padding(  
              padding: const EdgeInsets.all(14.0),  
              child: Align(  
                alignment: Alignment.topRight,  
                child: FloatingActionButton(  
                  onPressed: _onAddMarkerButtonPressed  , 
                  materialTapTargetSize: MaterialTapTargetSize.padded,  
                  backgroundColor: Colors.green,  
                  child: const Icon(Icons.map, size: 30.0),  
                ),  
              ),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}  