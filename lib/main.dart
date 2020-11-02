import 'package:learn_it/screens/authenticate/sign_in.dart';
import 'package:learn_it/screens/authenticate/sign_up.dart';
import 'package:learn_it/screens/home/home.dart';
import 'package:learn_it/services/auth.dart';

import './wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus &&
              currentFocus.focusedChild != null) {
            FocusManager.instance.primaryFocus.unfocus();
          }
        },
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'Montserrat',
              primaryColor: Colors.lightBlue[300],
              accentColor: Colors.amber[300],
              textTheme: TextTheme(
                headline1:
                    TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
              )),
          home: Wrapper(),
          routes: {
            SignUp.routeName: (_) => SignUp(),
            Home.routeName: (_) => Home(),
            SignIn.routeName: (_) => SignIn(),
          },
        ),
      ),
    );
  }
}
