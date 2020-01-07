import 'package:flutter/material.dart';
import 'dart:convert';
// import 'dart:html';
// import 'dart:html';
import 'package:get_ip/get_ip.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:graphe/OkayBye.dart';
import 'package:wifi/wifi.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' show Client;


class OkayBye extends StatelessWidget {
    String _ip = 'Unknown';
    String brokenn = ' ';

    

    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        title: Text("Chutti!", style: TextStyle(
              color: Colors.black
        ),),
        backgroundColor: Colors.yellow,

      ),

      body: 
            FutureBuilder(
            future: getMata(),
            builder: (BuildContext context,AsyncSnapshot snapshot){

            


               String snap = snapshot.data;

               print(snap);



                  return ListView.builder(
                    
                      itemCount: 1,
                      itemBuilder: (context,index){
                        return ListTile(

                          
                          
                          title: Text("\n Checkout : \n $snap ",style: TextStyle(
                             color: new Color(0xFF000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0,
                          ),),
                          subtitle: Text("\n\n\nPeace Maro \n .......✌🏻.......",style: TextStyle(
                             color: new Color(0xFF000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 70.0,
                          ),),

                          

                          
                          
                         

                          
                          
                          


                          
                          
                        );
                        
                      },

                    );

               

            }

            


          ),



          
          // new Text("\n Check out :  $snap \n ",style: TextStyle(
          //                    color: new Color(0xFF000000),
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 20.0,
          //                 ),),

          
          
          // new Text("\n !! Hum hai raahi pyaar ke, phir milenge, chalte chalte ahahah!! \n \n \n \n \n",style: TextStyle(
          //                    color: new Color(0xFF000000),
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 25.0,
          //                     letterSpacing: 1
          //                 ),),

          



        // ],
      // )
      

      // backgroundColor: Colors.white,





      
      

      
    );
  }

  Future getMata()async{
    // http.put('http://192.168.1.208/checking.php ', body: {'IP': onoIp});
    // http.patch('http://192.168.1.208/checking.php ');
    



    var url = 'http://192.168.1.208/test.php?Ip=_ip';
    http.Response response = await http.get(url);
    var data = response.body;
    
  return data;

 }

 Future<void> initPlatformState() async {
    String ipAddress;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      ipAddress = await GetIp.ipAddress;
    } on PlatformException {
      ipAddress = 'Failed to get ipAdress.';
    }

    _ip = ipAddress;
  }
}

class MemeAkKAj extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Implementation of iMageQ
    AssetImage assetImage = new AssetImage('images/Tata.gif');
    Image image = new Image(image:assetImage,width: 300.0,height: 300.0,);
    return Container(child: image,);
  }



}