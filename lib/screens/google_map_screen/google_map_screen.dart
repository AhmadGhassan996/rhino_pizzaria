import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({Key? key, required this.index}) : super(key: key);
  static const String namedRout = '/google_map_widget';
  final int index;

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  // var currentLocation;
  final Set<Marker> _marker = {};

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _marker.add(
        const Marker(
          infoWindow: InfoWindow(
            title: '',
          ),
          markerId: MarkerId('id'),
          position: LatLng(31.963158, 35.930359
              // context.read<HotelsProvider>().hbResponse.data![widget.index].lat,
              // context.read<HotelsProvider>().hbResponse.data![widget.index].lon,
              ),
        ),
      );
    });
  }

  GoogleMapController? googleMapController;

  @override
  // void initState() {
  //   Geolocator.getCurrentPosition().then((value) {
  //   //  currentLocation = value;
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: GoogleMap(
          markers: _marker,
          initialCameraPosition: const CameraPosition(
              target: LatLng(31.963158, 35.930359
                  // context.read<HotelsProvider>().hbResponse.data![widget.index].lat,
                  // context.read<HotelsProvider>().hbResponse.data![widget.index].lon,
                  ),
              zoom: 13),
          onMapCreated: _onMapCreated,
        ),
      ),
    );
  }
}
