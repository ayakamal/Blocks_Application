import 'package:app2/components/applocal.dart';
import 'package:app2/pages/IsoVolcanic.dart';
import 'package:app2/pages/categories.dart';
import 'package:app2/pages/choosecountry.dart';
import 'package:app2/pages/concrete.dart';
import 'package:app2/pages/isoConcrete.dart';
import 'package:app2/pages/sliderintro/sliderintro.dart';
import 'package:app2/pages/volcanic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import './pages/home.dart';
import './pages/test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './pages/login.dart';
import './components/applocal.dart';

SharedPreferences mySharedPreferences;
void main() async{
  SharedPreferences.setMockInitialValues({});
  WidgetsFlutterBinding.ensureInitialized();
  mySharedPreferences = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ChangeLang(),
        )
      ],
      child:MaterialApp(
      //debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      title: 'Block App',
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: TextStyle(color:Colors.orange[900]),
        ),
        fontFamily: 'RobotoCondensed',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SliderIntro() ,
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale("en" , ""),
        Locale("ar" , ""),

      ],
      //locale: Locale("ar" , ""),
      localeResolutionCallback: (currentLang , supportLang){
        if(currentLang != null){
          for(Locale locale in supportLang){
            if(locale.languageCode == currentLang.languageCode){
              mySharedPreferences.setString("lang",currentLang.languageCode) ; 
              return currentLang ;  
            }
          }
        }
        return supportLang.last ;
      },
      routes: {
        'homepage' : (context){
          return Home();
        },
        'categories' : (context){
          return Categories();
        },
        'volcanic' : (context){
          return Volcanic();
        },
        'isovolcanic' : (context){
          return IsoVolcanic();
        },
        'concrete' : (context){
          return Concrete();
        },
        'isoconcrete' : (context){
          return IsoConcrete();
        },
        'Login' : (context){
          return LogIn();
        },
        
      },
    ),
    );
  }
  
}
class ChangeLang with ChangeNotifier {

}

