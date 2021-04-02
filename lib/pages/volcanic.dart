import 'dart:ui';

import 'package:flutter/material.dart';
import '../components/mydrawer.dart';

class Volcanic extends StatefulWidget {
  @override
  _VolcanicState createState() => _VolcanicState();
}

class _VolcanicState extends State<Volcanic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Volcanic Blocks'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body:ListView(
        children: <Widget>[
          Container(
            height: 300, 
            //width: double.infinity,
            child: GridTile(
              child: Image.asset('images/category/B.jpg'),
              footer: Container(
                padding:EdgeInsets.all(10) ,height:80,color:Colors.black.withOpacity(0.3) ,alignment: Alignment.center,
                child: Text('Volcanic Blocks', 
                style: TextStyle(color:Colors.white,fontSize:20, fontWeight:FontWeight.w700),),)
            ),
          ),
          //End Header Page
          Container(padding: EdgeInsets.all(10),child: Text('Description', style: TextStyle(fontSize:20),),),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(children: <Widget> [

                Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(15),color: Colors.blue,
                  child:  RichText(text: TextSpan(style: TextStyle(fontSize:18) ,children: <TextSpan> [
                    TextSpan(text: "Here is the Volcanic Blocks Description",),
                ] ),),),


              ],
            ),
          ),
        ],
      ),
    );
  }
}