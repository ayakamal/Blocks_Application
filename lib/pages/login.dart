import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

showloading(context) {
  return showDialog(context: context ,builder: (context){
    return AlertDialog(content:Row(children: <Widget>[Text("Loading... "),CircularProgressIndicator()],),) ;
  });
  
}
showdialogall(context,String mytitle, String mycontent) {
  return showDialog(context: context ,builder: (context){
    return AlertDialog(title: Text(mytitle),content: Text(mycontent),actions: <Widget>[
      FlatButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Done"))
    ],) ;
  });
}

class _LogInState extends State<LogIn> {
  Pattern pattern =r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  bool isLoading = false ;
  TapGestureRecognizer _changesign ;
  //Start Form Controller
  TextEditingController username = new TextEditingController() ;
  TextEditingController email = new TextEditingController() ;
  TextEditingController password = new TextEditingController() ;
  TextEditingController confirmpassword = new TextEditingController() ;

  final GlobalKey<FormState> formstatesignin = new GlobalKey<FormState>() ;
  final GlobalKey<FormState> formstatesignup = new GlobalKey<FormState>() ;

  String validglobal (String val){
    if(val.isEmpty){
      return "Field cannot be empty" ;
    }
  }

  String validusername (String val){
    if (val.trim().isEmpty){
      return "Username cannot be empty" ;
    }
    if (val.trim().length < 4){
      return "Username cannot be less than 4 letters" ;
    }
    if (val.trim().length > 20){
      return "Username cannot be more than 20 letters" ;
    }
  }

  String validpassword (String val){
    if (val.trim().isEmpty){
      return "Password cannot be empty" ;
    }
    if (val.trim().length < 4){
      return "Password cannot be less than 4 letters" ;
    }
    if (val.trim().length > 20){
      return "Password cannot be more than 20 letters" ;
    }
  }

  String validconfirmpassword (String val){
    if(val != password.text){
      return "Password doesn't match" ;
    }
  }

  String validemail (String val){
    if (val.trim().isEmpty){
      return "Email cannot be empty" ;
    }
    if (val.trim().length < 4){
      return "Email cannot be less than 4 letters" ;
    }
    if (val.trim().length > 20){
      return "Email cannot be more than 20 letters" ;
    }
    RegExp regex = new RegExp(pattern);

    if(!regex.hasMatch(val)){
      return "Incorrect Email (example@gmail.com)";
    }
  }

//   Future<MODEL> signin() async {
//   Map<String, String> headers = {"Content-type": "application/json"};
//   var url = "http://192.168.1.1/MyBlock_App/login.php" ;
//   final result = await http.get(url, headers: headers);
//   print("Content type: ${result.headers['content-type']}");
//   if (result.statusCode >= 200 && result.statusCode < 300 ) {
//      return json.decode(result.body);
//   } else {
//      return json.decode(null);
//   }                                                                                         
// }

  signin() async{
    showloading(context) ;
    Navigator.of(context).pushNamed("homepage") ;
    /*final FormState formdata = formstatesignin.currentState ;
    if(formdata.validate()){
      formdata.save() ;
      // setState(() {
      //   isLoading = true ;
      // });
      showloading(context) ;
      var data = {"email" : email.text, "password" : password.text} ;
      //var url = "http://192.168.1.1/MyBlock_App/login.php" ;
      var url = "http://10.0.2.2/MyBlock_App/login.php" ;
      // port: 3306;
      var response = await http.post(url, body: data) ;
      var responsebody = convert.jsonDecode(response.body) ;
      if(responsebody['status'] == "success"){
        print(responsebody['username']) ;
        Navigator.of(context).pushNamed("homepage") ;
      }else{
        print('login failed') ;
        showdialogall(context, "Error", "Email or Password is wrong") ;
        // setState(() {
        // isLoading = false ;
        //  });
        if (Navigator.of(context).canPop()) {
          Navigator.of(context).pop() ;
        }
      
      }
    }else{
      print('not valid') ;
    }*/
  }

  signup(){
    var formdata = formstatesignup.currentState ;
    if(formdata.validate()){
      print('valid') ;
    }else{
      print('not valid') ;
    }
  }


  bool showsignin = true;
  @override
  void initState() {
    _changesign = new TapGestureRecognizer()..onTap =(){
      setState(() {
        showsignin = !showsignin;
      });
    };
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var mdw = MediaQuery.of(context).size.width;
    return Scaffold(
       body: Stack(
         children: <Widget>[
           Container(height: double.infinity, width: double.infinity,),
              buildPositionedTop(mdw),
              buildPositionedBottom(mdw),
              Container(height: mdw*2, child: SingleChildScrollView(child: Column(children: <Widget>[
              Center(child: Container( margin: EdgeInsets.only(top:30),child: 
              Text(showsignin?'Sign In' : 'Register', style: TextStyle(color: Colors.white, fontSize: 20),)),),
              Padding(padding: EdgeInsets.only(top:20),),
              buildContainerAvatar(mdw),
              showsignin ?buildFormBoxSignIn(mdw):buildFormBoxSignUp(mdw),
              Container(
                margin: EdgeInsets.only(top:20),
                child: Column(children: <Widget>[
                  showsignin?InkWell(onTap:(){},child: Text("Forgot Password?",style: TextStyle(color: Colors.blue,fontSize: 15,fontWeight: 
                          FontWeight.w700,),),):SizedBox(),
                  SizedBox(height: showsignin?24:10,),
                  RaisedButton(
                    elevation: 10,
                    color: showsignin?Colors.blue:Colors.grey[700],
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    onPressed:showsignin? signin : signup,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text( showsignin?"Sign In":"Register",style: TextStyle(color: Colors.white,fontSize: 18,),),
                        Container(margin: EdgeInsets.only(top:4,),),
                      ],
                      ),), 
                      //isLoading ? CircularProgressIndicator() : Padding(padding:EdgeInsets.all(0) ),
                      Container(margin: EdgeInsets.only(top:15),child: RichText(
                        text: TextSpan(style: TextStyle(color: Colors.black,fontSize: 16,fontFamily:'RobotoCondensed'),children:<TextSpan> [
                          TextSpan(text:showsignin? "No Account?":"Have an Account?"),
                          TextSpan(recognizer: _changesign,text:showsignin? " Create New Account": " Sign In",style: TextStyle(color: Colors.green,fontWeight: 
                          FontWeight.w700,),),

                        ])),),
                        SizedBox(height: 10,),       
                   Row(children: <Widget>[
                     Padding(padding: EdgeInsets.only(right:10)),
                     Expanded(
                       child: RaisedButton(
                         padding: EdgeInsets.all(3),
                         color: Colors.red[400],
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Image.asset("images/icons/gg.png",width: 25, height: 25,),
                         Text("  Sign with Google", style: TextStyle(color: Colors.white, fontSize: 12),),
                       ],
                     ),
                     onPressed: (){})),
                     Padding(padding: EdgeInsets.only(right:10)),
                     Expanded(
                       child: RaisedButton(
                         padding: EdgeInsets.all(5),
                         color: Colors.blue[700],
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[
                         Image.asset("images/icons/f.png",width: 25, height: 25,),
                         Text("  Sign with Facebook", style: TextStyle(color: Colors.white, fontSize: 12),),
                       ],
                     ),
                     onPressed: (){})),
                     Padding(padding: EdgeInsets.only(right:10)),
                   ],),              
                ],),
              ),
            ],),) ,
              ),
           
         ],
       ),
      //ListView(
      //   children: <Widget> [
      //     Container(
      //       padding: EdgeInsets.all(10),
      //       child: Form(
      //         child: Column(
      //           children: <Widget>[
      //             TextFormField(
      //               decoration: InputDecoration(
      //                 //hintText: "Enter Your Name",
      //                 //contentPadding: EdgeInsets.all(10),
      //                 filled: true,
      //                 fillColor: Colors.white,
      //                 prefixIcon: Padding(padding: EdgeInsets.only(left:20),child: Icon(Icons.supervisor_account, size: 40,),),
      //                 labelText: "Enter Your Name",
      //                 enabledBorder: OutlineInputBorder(
      //                   borderRadius: BorderRadius.circular(40),
      //                   //borderSide: BorderSide(color:Colors.blue),
      //                 ), 
      //                 focusedBorder: OutlineInputBorder(
      //                   borderSide: BorderSide(color:Colors.green),
      //                   borderRadius: BorderRadius.circular(40),
      //                 ),    
      //               ) ,
      //             ),
      //           ],
      //         ),
      //         ),
      //     ),
      //   ],
      // ),

    );
  }

  Center buildFormBoxSignIn(double mdw) {
    return Center(child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeOutBack,
              margin: EdgeInsets.only(top:mdw/15),
              height: mdw/1.5,width: mdw/1.2,
              decoration: BoxDecoration(
                color:Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black,spreadRadius: 0.1,blurRadius: 1,offset: Offset(1, 1)),
                ],
              ),
              child: Form(
                autovalidate: true,
                key: formstatesignin,
                child: Container(
                  margin: EdgeInsets.only(top:20),
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Start Text Username
                        Text("Email", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        buildTextFormFieldAll("Enter Email Here",false, email, validemail),
                        //End Text Username
                        SizedBox(height: 10,),
                        //Start Text Password
                        Text("Password",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        buildTextFormFieldAll("Enter Password Here",true, password, validpassword),
                        //End Text Password

                    ],),
                  ),
                ),),
            ),
            );
  }

  Center buildFormBoxSignUp(double mdw) {
    return Center(child: AnimatedContainer(
              duration: Duration(milliseconds: 600),
              curve: Curves.easeInOutBack,
              margin: EdgeInsets.only(top:showsignin?mdw/15:mdw/30),
              height: showsignin? mdw/1.5: 1.1*mdw,
              width: mdw/1.2,
              decoration: BoxDecoration(
                color:Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black,spreadRadius: 0.1,blurRadius: 1,offset: Offset(1, 1)),
                ],
              ),
              child: Form(
                autovalidate: true,
                key: formstatesignup,
                child: Container(
                  margin: EdgeInsets.only(top:10),
                  padding: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Start Text Username
                        Text("Username", style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        buildTextFormFieldAll("Enter Usename Here",false, username, validusername),
                        //End Text Username
                        SizedBox(height: 10,),
                        //Start Text Password
                        Text("Password",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        buildTextFormFieldAll("Enter Password Here",true, password, validpassword),
                        //End Text Password
                        SizedBox(height: 10,),
                        //Start Text Password Again
                        Text("Confirm Password",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        buildTextFormFieldAll("Enter Password Here Again",true, confirmpassword, validconfirmpassword),
                        //End Password Again
                        SizedBox(height: 10,),
                        //Start Text Email
                        Text("Email",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600),),
                        SizedBox(height: 10,),
                        buildTextFormFieldAll("Enter Email Here",false, email, validemail),
                        //End Text email

                    ],),
                  ),
                ),),
            ),
            );
  }

  TextFormField buildTextFormFieldAll(String myhinttext,bool pass,TextEditingController myController, myvalid) {
    return TextFormField(
      controller: myController,
      validator: myvalid,
      obscureText: pass,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(4),
        hintText: myhinttext,
        filled: true,
        fillColor: Colors.grey[200],
        //prefixIcon: Padding(padding: EdgeInsets.only(left:20),child: Icon(Icons.supervisor_account, size: 40,),),
        //labelText: "Enter Your Name",
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.grey[500],style: BorderStyle.solid,width: 1,),
        ),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color:Colors.blue,style: BorderStyle.solid,width: 1,),
        ),
      ),
    );
  }

  AnimatedContainer buildContainerAvatar(double mdw) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: 100,width: 100, decoration: BoxDecoration(
      color: showsignin?Colors.blue: Colors.grey[700],
      borderRadius: BorderRadius.circular(100),
      boxShadow: [
        BoxShadow(color: Colors.black, blurRadius: 3,spreadRadius: 0.1),
      ],
      ),
      child: InkWell(
        onTap: (){
          setState(() {
            showsignin = !showsignin ;
          });
        },
        child: Stack(children: <Widget>[
          Positioned(top: 25,right: 25,child: Icon(Icons.person_outline,size: 50,color: Colors.white,),),
          Positioned(top: 35,left: 60,child: Icon(Icons.arrow_forward,size: 30,color: Colors.white,),),
        ],),
      ),
      );
  }

  Positioned buildPositionedTop(double mdw) {
    return Positioned(child: Transform.scale(
             scale: 1.3,
             child: Transform.translate(
               offset: Offset(0,-mdw / 1.7),
               child: AnimatedContainer(
                 duration: Duration(milliseconds: 500),
                 height:mdw, width: mdw, decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(mdw),
                 color: showsignin?Colors.grey[800].withOpacity(0.8):Colors.blue[800].withOpacity(0.8),
               ),),
             ),
            ),);
  }

  Positioned buildPositionedBottom(double mdw) {
    return Positioned(
              top: 0.5*mdw,
              right: mdw/1.5,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                height:mdw, width: mdw, decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(mdw),
                color:showsignin? Colors.blue[800].withOpacity(0.4):Colors.grey[800].withOpacity(0.4), ),),
            );
  }
}