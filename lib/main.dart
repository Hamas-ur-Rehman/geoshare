import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share/share.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "sms",home: MyApp2()

    );
  }
}


class MyApp2 extends StatefulWidget {
  @override
  _MyApp2State createState() => _MyApp2State();
}

class _MyApp2State extends State<MyApp2> {
  String _locationMesaage = "";

  void _getCurrentLocation() async {

    final position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);

    setState(() {
      _locationMesaage = "${position.latitude}, ${position.longitude}";
    });

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      title: 'Flutter Demo',
      home: Scaffold(
        backgroundColor: Colors.red[300],
        appBar: AppBar(

          title: Text("LOCATION SERVICES"),
          elevation: 0.0,
          centerTitle: true,
          backgroundColor: Colors.black87,),


        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            // Center(child: SelectableText(_locationMesaage , style: TextStyle(fontSize: 30),)),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(20),
                  child: SelectableText(_locationMesaage , style: TextStyle(fontSize: 27.6),),

                ),
              ],
            ),
            RaisedButton.icon(onPressed: () { _getCurrentLocation();},
              color: Colors.white,
              icon: Icon(Icons.location_on),
              label: Text("FIND COORDINATES"),
              splashColor: Colors.red[600],
            ),

            RaisedButton.icon(onPressed: () {
              Share.share(_locationMesaage);
            },
              color: Colors.white,
              icon: Icon(Icons.share),
              label: Text("SHARE COORDINATES"),
              splashColor: Colors.red[600],
            ),

          ],) ,),




    );





  }
}




//dependencies
