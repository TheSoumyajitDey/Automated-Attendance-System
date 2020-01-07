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




class MySqlConnection extends StatefulWidget {
  @override
  _MySqlConnectionState createState() => _MySqlConnectionState();
}

class _MySqlConnectionState extends State<MySqlConnection> {

  String a = "";
  String _ip = 'Unknown';
  String onoIp = "192.168.1.202";


  void initState() {
    super.initState();
    initPlatformState();
    // getData();
    // post();

    // http.get('http://192.168.1.208/checking.php? IP = onoIp');
    
    


  //   Dio dio = new Dio();

  // final Map<String,dynamic> _login={
  // "Io":"192.168.1.104",
  
// };


//     dio.post("http://192.168.31.55/checking.php",queryParameters: _login);



   
  }

  void post() async {
   final loginData = await http.post(
  "http://192.168.1.208/checking.php"

); 

  print(loginData);

  }


  Widget titleSection = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        
        Padding(
          
          padding:  EdgeInsets.all(50.0),
          
          
          child: Text(
          "Hi,\n134",
          style: TextStyle(
            color: new Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontSize: 40.0,
            
          ),

          
        )
        ),

        Padding(
          
          padding:  EdgeInsets.all(50.0),
          
          
          child: Text(
          "Check in Time :    123 ",
          style: TextStyle(
            color: new Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            
          ),

          
        )
        ),
        Padding(
          
          padding:  EdgeInsets.all(50.0),
          
          
          child: Text(
          "Check out Time :   123 ",
          style: TextStyle(
            color: new Color(0xFF000000),
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            
          ),

          
        )
        ),






      ],

    ),

  );

 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
        elevation: 20,
        title: Text("The Graphē",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.yellow,
        centerTitle: true,

        ),
        
         
          
        body: FutureBuilder(
          future: getData(),
          builder: (BuildContext context,AsyncSnapshot snapshot){

            


               String snap = snapshot.data;
               
                
                List broken=snap.split("_");



                String date=broken[0];
                String name=broken[1];

                
                
              
              



               
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                    child: CircularProgressIndicator(),
                    

                    
                    
                );
                

                
              }

                  return ListView.builder(
                    
                      itemCount: 1,
                      itemBuilder: (context,index){
                        return ListTile(

                          
                          
                          subtitle: Text(" \nHi, \n $name ",style: TextStyle(
                             color: new Color(0xFF000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 40.0,
                          ),),

                          
                          
                          title: Text(" \nCheck-In: \n $date  ",style: TextStyle(
                             color: new Color(0xFF000000),
                              fontWeight: FontWeight.bold,
                              fontSize: 50.0,
                          ),),

                          
                          
                          


                          
                          
                        );
                        
                      },

                    );

                  
            

          },
        ),

       floatingActionButton: Container(
        height: 150.0,
        width: 150.0,
        
        child: FloatingActionButton(
          
                          backgroundColor: Colors.yellow,
                          onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => OkayBye()) );

                                  print(_ip);
                                  getDaoNah();
                                  
                          },
                          child: Text("Checkout" ,style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20.0,
                          ),),
                          
                        ),
        
        
       )
        

        
      

        
    );
  }

   Future getData()async{
    // http.put('http://192.168.1.208/checking.php ', body: {'IP': onoIp});
    // http.patch('http://192.168.1.208/checking.php ');
    



    var url = 'http://192.168.1.208/checking.php?Ip=$_ip';
    http.Response response = await http.get(url);
    var data = response.body;
    
  return data;

 }


  Future getDaoNah()async{
  // http.post('http://192.168.1.208/checking.php ', body: {'IP': onoIp});
  // http.put('http://192.168.1.208/checking.php ', body: {'IP': onoIp});
    var url = 'http://192.168.1.208/test.php?Ip=$_ip';
    http.Response response = await http.get(url);
    var data = response.body;
    
  return data;

 }

 Future get selfIP async {
    String ip = await Wifi.ip;
    return (ip);
}

Future<void> initPlatformState() async {
    String ipAddress;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      ipAddress = await GetIp.ipAddress;
    } on PlatformException {
      ipAddress = 'Failed to get ipAdress.';
    }

    if (!mounted) return;

    setState(() {
      _ip = ipAddress;
    });
  }


}

