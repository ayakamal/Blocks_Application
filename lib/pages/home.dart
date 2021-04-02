import 'package:app2/components/applocal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_pro/carousel_pro.dart';
import '../components/mydrawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future getData() async {
    var url = "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blocks App'),
        backgroundColor: Colors.blue,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: DataSearch());
            // return showDialog(context: context, builder:(context){
            //   return AlertDialog(title: Text("search"),content: Text("Enter Block Type"),actions:<Widget> [
            //     FlatButton(onPressed: (){}, child: Text("Done")),
            //     FlatButton(onPressed: (){}, child: Text("Cancel")),
            //   ],);
            // });
          })
        ],
        centerTitle: true,
        elevation: 6,
        //leading: IconButton(icon: Icon(Icons.search), onPressed: null),
      ),
      drawer: MyDrawer(),
      //End Drawer
     // body: Container(child:Text("${getLang(context, "welcome")}")),
      body: ListView(
        children: <Widget> [
          Container(
            child: SizedBox(
            height: 250,
            width: double.infinity,
            child: Carousel(
              boxFit: BoxFit.cover,
              autoplay: true,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(milliseconds: 1000),
              dotSize: 6.0,
              dotBgColor: Colors.black.withOpacity(0.4),
              dotIncreasedColor: Colors.blue,
              //dotPosition: DotPosition.topRight,
              //dotVerticalPadding: 10.0,
              showIndicator: true,
              //indicatorBgPadding: 7.0,
              images: [              
                Image.asset('images/slider/block borkany m3zol.jpg', fit: BoxFit.fill,),
                Image.asset('images/slider/block asmnty m3zol.jpg', fit: BoxFit.cover,),
                Image.asset('images/slider/block borkany.jpg', fit: BoxFit.cover,),
                Image.asset('images/slider/block asmnty.jpg', fit: BoxFit.cover,),
              ],
            ),
           ),
          ),
          //End Carousel
          // SizedBox(
          //   height: 20,
          // ),
          //start categories
          Container(
            padding: EdgeInsets.all(10),
            child: Text('Categories', style: TextStyle(fontSize: 20,color: Colors.blue),),
          ),
          Container(
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget> [
                Container(
                  height: 120,
                  width: 120,
                  child: ListTile(
                    title: Image.asset('images/category/B.jpg',height: 80,width: 80,fit: BoxFit.fill,),
                    subtitle: Container(child: Text('Volcanic Blocks',textAlign: TextAlign.center,)),
                    onTap: (){
                      Navigator.of(context).pushNamed('volcanic');
                    },
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: ListTile(
                    title: Image.asset('images/category/IB.jpg',height: 80,width: 80,fit: BoxFit.fill,),
                    subtitle: Container(child: Text('Isolated Volcanic Blocks',textAlign: TextAlign.center,)),
                    onTap: (){
                      Navigator.of(context).pushNamed('isovolcanic');
                    },
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: ListTile(
                    title: Image.asset('images/category/C.jpg',height: 80,width: 80,fit: BoxFit.fill,),
                    subtitle: Container(child: Text('Cement Blocks',textAlign: TextAlign.center,)),
                    onTap: (){
                      Navigator.of(context).pushNamed('concrete');
                    },
                  ),
                ),
                Container(
                  height: 120,
                  width: 120,
                  child: ListTile(
                    title: Image.asset('images/category/IC.jpg',height: 80,width: 80,fit: BoxFit.fill,),
                    subtitle: Container(child: Text('Isolated Cement Blocks',textAlign: TextAlign.center,)),
                    onTap: (){
                      Navigator.of(context).pushNamed('isoconcrete');
                    },
                  ),
                ),
                //End categories
              ],
            ),
          ),
        //start Gridview
         Container(
            padding: EdgeInsets.all(10),
            child: Text('Categories', style: TextStyle(fontSize: 20,color: Colors.blue),),
          ),
          Container(
            height: 400,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget> [
                InkWell(child: GridTile(child: Image.asset('images/category/B.jpg'),footer: Container(height: 25,color: Colors.black.withOpacity(0.5),child: Text('Volcanic Blocks',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight:FontWeight.w700),),)),
                onTap: (){ Navigator.of(context).pushNamed('volcanic'); },),
                InkWell(child: GridTile(child: Image.asset('images/category/IB.jpg'),footer: Container(height: 25,color: Colors.black.withOpacity(0.5),child: Text('Isolated Volcanic Blocks',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),)),
                onTap: (){ Navigator.of(context).pushNamed('isovolcanic'); },),
                InkWell(child: GridTile(child: Image.asset('images/category/C.jpg'),footer: Container(height: 25,color: Colors.black.withOpacity(0.5),child: Text('Cement Blocks',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),)),
                onTap: (){ Navigator.of(context).pushNamed('concrete'); },),
                InkWell(child: GridTile(child: Image.asset('images/category/IC.jpg'),footer: Container(height: 25,color: Colors.black.withOpacity(0.5),child: Text('Isolated Cement Blocks',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),),)),
                onTap: (){ Navigator.of(context).pushNamed('isoconcrete'); },),
              ],
            ),),    
        ],
      ),
    );
  }
} 


class DataSearch extends SearchDelegate<String>{
  @override
  List<Widget> buildActions(BuildContext context) {
      // Action For Appbar
      //throw UnimplementedError();
       return [
        IconButton(onPressed: (){}, 
        icon: Icon(Icons.clear),)
      ];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icon Leading
      //throw UnimplementedError();
       return IconButton(onPressed: (){
         close(context,null);
       }, icon: Icon(Icons.arrow_back),);
     
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // Results Search
      //throw UnimplementedError();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    // Show when Someone Searches for Something
    //throw UnimplementedError();
    return Container(child: Column(
      children: [
        Text("Search Body"),
        // Text("Isolated Volcanic Blocks"),
        // Text("Cement Blocks"),
        // Text("Isolated Cement Blocks"),
      ],
    ),);
  }

}

