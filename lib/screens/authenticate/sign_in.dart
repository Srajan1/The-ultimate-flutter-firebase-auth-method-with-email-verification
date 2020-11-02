import 'package:flutter/material.dart';
import 'package:learn_it/services/auth.dart';
import '../../models/error.dart';

class SignIn extends StatefulWidget {
  static const routeName = '/signin';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final email = TextEditingController();
  final pass = TextEditingController();
  final AuthService _auth = AuthService();
  String err = '';
  GlobalKey _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Form(
              //     child: Column(
              //   children: [
              //     TextField(
              //       controller: email,
              //     ),
              //     TextField(
              //       controller: pass,
              //     ),
              //     FlatButton(
              //         onPressed: () async {
              //           var value = new ErrorMsg(' ');
              //           await _auth.signUp(email.text, pass.text, value);
              //           setState(() {
              //             err = value.error.toString();
              //           });
              //           print(value);
              //         },
              //         child: Text('Sign Up'))
              //   ],
              // )),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      child: Text('Hello',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(16.0, 175.0, 0.0, 0.0),
                      child: Text('There',
                          style: TextStyle(
                              fontSize: 80.0, fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(220.0, 175.0, 0.0, 0.0),
                      child: Text(' .',
                          style: TextStyle(
                            fontSize: 80.0,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).accentColor,
                          )),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) =>
                              value.isEmpty ? 'Please enter a value' : null,
                          controller: email,
                          decoration: InputDecoration(
                              labelText: 'EMAIL',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor))),
                        ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          validator: (value) => value.length < 6
                              ? 'Please enter a password longer than 6 characters'
                              : null,
                          controller: pass,
                          decoration: InputDecoration(
                              labelText: 'PASSWORD',
                              labelStyle: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context).accentColor))),
                          obscureText: true,
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          alignment: Alignment(1.0, 0.0),
                          padding: EdgeInsets.only(top: 15.0, left: 20.0),
                          child: InkWell(
                            onTap: () async {
                              var value = new ErrorMsg(' ');
                              print(value.error);
                              await _auth.resetPassword(email.text, value);
                              setState(() {
                                err = value.error.toString();
                              });
                            },
                            child: Text(
                              'Forgot Password',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat',
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),
                        // FlatButton(
                        //     onPressed: () async {
                        //       var value = new ErrorMsg(' ');
                        //       print(value.error);
                        //       await _auth.signIn(email.text, pass.text, value);
                        //       setState(() {
                        //         err = value.error.toString();
                        //       });
                        //       print('$err err msg');
                        //     },
                        //     child: Text('Sign In'))
                        SizedBox(height: 40.0),
                        Container(
                          height: 40.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Theme.of(context).accentColor,
                            color: Theme.of(context).accentColor,
                            elevation: 7.0,
                            child: FlatButton(
                              onPressed: () async {
                                {
                                  var value = new ErrorMsg(' ');
                                  print(value.error);
                                  await _auth.signIn(
                                      email.text, pass.text, value);
                                  setState(() {
                                    err = value.error.toString();
                                  });
                                  // print('$err err msg');
                                }
                              },
                              child: Center(
                                child: Text(
                                  'LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              // FlatButton(
              //   child: Text('sign in anon'),
              //   onPressed: () async {
              //     dynamic result = _auth.signInAnon();
              //     if (result == null) {
              //       print('not signed in');
              //     } else {
              //       print('signed in');
              //       print(result);
              //     }
              //   },
              // ),
              SizedBox(height: 20.0),
              InkWell(
                onTap: () async {
                  var value = new ErrorMsg(' ');
                  await _auth.signInWithGoogle(value);
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  height: 40.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                            width: 1.0),
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20.0)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child:
                              ImageIcon(AssetImage('assets/google_logo.png')),
                        ),
                        SizedBox(width: 10.0),
                        Center(
                          child: Text('Log in with Google',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'New here ?',
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/signup');
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: Theme.of(context).accentColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    err,
                    style: TextStyle(
                      color: Colors.red[400],
                      // backgroundColor: Colors.red[100],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
