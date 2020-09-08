import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:exemplo_9/pages/maps.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GPSPage extends StatefulWidget {
  @override
  _GPSPageState createState() => _GPSPageState();
}

class _GPSPageState extends State<GPSPage> {
  double _lat;
  double _long;
  bool _isLoading;

  _getLastKnownPosition() async {
    setState(() {
      _isLoading = true;
    });

    Position position = await getLastKnownPosition();

    setState(() {
      _lat = position.latitude;
      _long = position.longitude;
      _isLoading = false;
    });
  }

  _getLocation() async {
    setState(() {
      _isLoading = true;
    });

    Position position = await getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _lat = position.latitude;
      _long = position.longitude;
      _isLoading = false;
    });
  }

  _goToMap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MapsPage(
          lat: _lat,
          long: _long,
        ),
      ),
    );
  }

  _share() {
    Share.text('Location', 'Latitude $_lat \n Longitude $_long', 'text/plain');
  }

  @override
  void initState() {
    _getLastKnownPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.gps_fixed),
        onPressed: _long == null ? _getLocation : _share,
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.greenAccent,
          child: _isLoading
              ? CupertinoActivityIndicator()
              : Column(
                  children: [
                    Text('Latitude $_lat'),
                    Text('Longitude $_long'),
                    CupertinoButton(child: Text('Mapa'), onPressed: _goToMap)
                  ],
                )),
    );
  }
}
