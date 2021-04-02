import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Test extends StatefulWidget {
  Test(String s);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Future getData() async {
    var url = "https://jsonplaceholder.typicode.com/posts" ;
    var response = await http.get(url);
    var responsebody = convert.jsonDecode(response.body) ;
    return responsebody  ; 
  }
  // void initState() {
  //   getData();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
      ),
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData){
           return ListView.builder(itemCount: snapshot.data.length,itemBuilder: (context, i) {
             return Container(child: Text(snapshot.data[i]['title']),) ; 
           }) ;
          }
          return CircularProgressIndicator() ;
        }, 
      ),
    );
  }
}