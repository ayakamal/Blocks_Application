import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Welcome User"),
            accountEmail: Text("Username@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
              //backgroundColor: Colors.lightGreen.shade500,
              //child: Text('A'),
            ),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              image: DecorationImage(
                  image: AssetImage("images/block cover.jpg"), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            title: Text("Home",),
            leading: Icon(Icons.home_rounded, 
            color: Colors.blue,size: 25,),
            //dense: true,
            onTap: (){
              Navigator.of(context).pushNamed('homepage');
            },
            contentPadding: EdgeInsets.all(5),
          ),
          ListTile(
            title: Text("Categories",),
            leading: Icon(Icons.category_rounded,
            color: Colors.blue, size: 25, ),
            onTap: (){
              Navigator.of(context).pushNamed('categories');
            },
            contentPadding: EdgeInsets.all(5),
          ),
          ListTile(
            title: Text("Your orders"),
            leading: Icon(Icons.list_alt_rounded,
            color: Colors.blue,size: 25,),
            onTap: (){},
            contentPadding: EdgeInsets.all(5),
          ),
          ListTile(
            title: Text("Offers"),
            leading: Icon(Icons.local_offer_rounded,
            color: Colors.blue,size: 25,),
            onTap: (){},
            contentPadding: EdgeInsets.all(5),
          ),
          Divider(color: Colors.blue,),
          ListTile(
            title: Text("About"),
            leading: Icon(Icons.info,
            color: Colors.blue,size: 25,),
            onTap: (){},
            contentPadding: EdgeInsets.all(5),
          ),
           ListTile(
            title: Text("Settings"),
            leading: Icon(Icons.settings,
            color: Colors.blue,size: 25,),
            onTap: (){},
            contentPadding: EdgeInsets.all(5),
          ),
          ListTile(
            title: Text("Sign In"),
            leading: Icon(Icons.exit_to_app,
            color: Colors.blue,size: 25,),
            onTap: (){Navigator.of(context).pushNamed('Login');},
            contentPadding: EdgeInsets.all(5),
            
          ),

          ListTile(
            title: Text("Logout"),
            leading: Icon(Icons.exit_to_app,
            color: Colors.blue,size: 25,),
            onTap: (){Navigator.of(context).pushNamed('Login');},
            contentPadding: EdgeInsets.all(5),
            
          ),
        ]),
      );
  }
}