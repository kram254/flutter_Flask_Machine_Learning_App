import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool gotvalue = false;
  var imageUrl;

  getData() async{
    http.Response response = await http.get(Uri.parse('localhost:5000'));
    return response.body;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter with Flask"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Just flask demo',
            ),
            gotvalue?Container(
            child:Image.network(
                imageUrl)):
            // ignore: deprecated_member_use
            RaisedButton(onPressed:() async{
              var data = await getData();
              print(data);
              setState(() {
                imageUrl = data;
                gotvalue = true;
              });
            },
              child: Text("Predict"),
            )
          ],
        ),
      ),
    );
  }
}