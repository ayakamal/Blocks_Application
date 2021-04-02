import 'package:flutter/material.dart';
import '../components/mydrawer.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        centerTitle: true,
      ),
      drawer: MyDrawer(),
      body: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget> [
                InkWell(child: Card(child: Column(children: <Widget>[
                  Expanded(child: Image.asset('images/category/B.jpg',fit: BoxFit.cover,),),
                  Container(child: Text('Volcanic',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,),),),
                  ],),),onTap: (){
                    Navigator.of(context).pushNamed('volcanic');
                  },),

                InkWell(child: Card(child: Column(children: <Widget>[
                  Expanded(child: Image.asset('images/category/IB.jpg',fit: BoxFit.cover,),),
                  Container(child: Text('Isolated Volcanic',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,),),),
                  ],),),onTap: (){
                    Navigator.of(context).pushNamed('isovolcanic');
                  },),

                InkWell(child: Card(child: Column(children: <Widget>[
                  Expanded(child: Image.asset('images/category/C.jpg',fit: BoxFit.cover,),),
                  Container(child: Text('Cement',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,),),),
                  ],),),onTap: (){
                    Navigator.of(context).pushNamed('concrete');
                  },),

                InkWell(child: Card(child: Column(children: <Widget>[
                  Expanded(child: Image.asset('images/category/IC.jpg',fit: BoxFit.cover,),),
                  Container(child: Text('Isolated Cement',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,),),),
                  ],),),onTap: (){
                    Navigator.of(context).pushNamed('isoconcrete');
                  },),
      ],),
    );

  }
}
