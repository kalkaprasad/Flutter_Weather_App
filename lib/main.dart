import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() => runApp(wether());

class wether extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Wether App",
      color: Colors.deepOrange,
      debugShowCheckedModeBanner: false,
      home: myhome(),
    );
  }
}
class myhome extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _myhome();
  }
}
class _myhome extends State<myhome>
{


  void getlocation  () async
  {
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }


  void htttpdata() async
  {

Response response=  await get("https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22");
 print(response.statusCode);
 var data=response.body;
 if(response.statusCode==200)
   {

     print("All ok");
     
     
     var longi=jsonDecode(data)['coord']['lon'];
     print(" you gotted new langitutude $longi");
     var alt=jsonDecode(data)['weather'][0]['description'];

     var temp=jsonDecode(data)['main']['temp'];
     var pressure=jsonDecode(data)['main']['pressure'];
     print("pressure is $pressure");
     print(temp);
     print(alt);


     
   }
 else
   {print("Not Okk,Somthing Error");
   }

  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: Text("Wheter App"),centerTitle: true,elevation:20.0,),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new RaisedButton(
            color: Colors.deepOrange,
            child: Center(child: new Text("Get Location")),
            textColor: Colors.white,
            onPressed: (){
              getlocation  ();
              htttpdata();
            },
          ),
        ],

      )

    );  }




}