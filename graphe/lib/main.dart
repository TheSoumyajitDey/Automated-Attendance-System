import 'package:flutter/material.dart';
import 'package:graphe/homeScreen.dart';
import 'package:graphe/tataPage.dart';
import 'dart:convert';
import 'package:get_ip/get_ip.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:graphe/OkayBye.dart';
import 'package:wifi/wifi.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';



void main() {
  runApp(
    MaterialApp(
      home: MyApp(


      ),
      debugShowCheckedModeBanner: false,
    )
  );

}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(
        seconds: 3
      ),
      (){
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MySqlConnection()),(e)=> false,);
        
      },
    );
  }




  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GrapheImageAssest(),
        
      ),
      

    );
  }
}

class GrapheImageAssest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    AssetImage assetImage = new AssetImage('images/image.png');
    Image image = new Image(image:assetImage,width: 150.0,height: 150.0,);
    return Container(child: image,);
  }
}
