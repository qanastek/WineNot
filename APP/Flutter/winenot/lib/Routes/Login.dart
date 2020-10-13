import 'dart:io';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:winenot/Routes/Home.dart';
import 'package:winenot/Utils/Endpoints.dart';
import 'package:winenot/Utils/MyColors.dart';
import 'package:winenot/Widgets/FailedConnexion.dart';
import 'package:winenot/Widgets/NoConnexion.dart';

class Login extends StatefulWidget {

  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _loginFormKey = GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool _passwordHidden = true;

  @override
  void initState() {
    super.initState();

    setState(() {

      // Async fetch during the activity launch
      WidgetsBinding.instance.addPostFrameCallback((_) {

        // Ask for the permissions
        _askPermissions();

        // Show the no connexion dialog
        NoConnexion.show(context);

      });
    });
  }

  // Ask permission for the app
  _askPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.camera,
    ].request();
  }

  // Login button
  void _login() async {

    // Check connection
    if (_loginFormKey.currentState.validate()) {

      // Navigate to the home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home(title: 'WineNot')),
      );

      // Send HTTP request to the server
      final http.Response response = await http.get(
          Endpoints.logon(_username.text, _password.text)
      );

      // It's ok ?
      if (response.statusCode == 200) {

          // Navigate to the home
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Home(title: 'WineNot')),
          );
      }
      else {

        // Display the error message
        FailedConnexion.show(context);

        throw Exception('Failed to connect!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    // Forgot password
    void _forgotPassword() async {

      const url = 'https://flutter.dev';

      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              MyColors.gradientPrimary,
              MyColors.gradientSecondary,
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 40.0,
            right: 40.0,
          ),
          child: Center(

            // Login form
            child: Form(
              key: _loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  // Brand start
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        bottom: 0.0
                    ),
                    child: Text(
                      "CERI",
                      style: TextStyle(
                        color: MyColors.loginBrandStart,
                        fontWeight: FontWeight.w900,
                        fontSize: 55,
                      ),
                    ),
                  ),

                  // Brand end
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                        bottom: 25.0
                    ),
                    child: Text(
                      "Wine",
                      style: TextStyle(
                        color: MyColors.loginBrandEnd,
                        fontWeight: FontWeight.w900,
                        fontSize: 90,
                      ),
                    ),
                  ),

                  // Identifiant
                  Container(
                    padding: EdgeInsets.only(
                        bottom: 25.0
                    ),
                    child: TextFormField(
                      controller: _username,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veuillez saisir votre identifiant';
                        }
                        return null;
                      },
                      cursorColor: MyColors.loginCursor,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.loginTextFieldContent,
                      ),
                      decoration: InputDecoration(
                          labelText: 'Identifiant',
                          labelStyle: TextStyle(
                            color: MyColors.loginTitle,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.loginTextFieldUnderLine),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.loginText),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: MyColors.loginText),
                          ),
                          icon: const Padding(
                            padding: const EdgeInsets.only(top: 15.0),
                            child: const Icon(
                              Icons.account_circle,
                              color: MyColors.loginIcons,
                            ),
                          )
                      ),
                    ),
                  ),

                  // Password
                  Container(
                    child: TextFormField(
                      obscureText: _passwordHidden,
                      controller: _password,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Veuillez saisir votre mot de passe';
                        }
                        return null;
                      },
                      cursorColor: MyColors.loginCursor,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: MyColors.loginTextFieldContent,
                      ),
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                        labelStyle: TextStyle(
                          color: MyColors.loginTitle,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.loginTextFieldUnderLine),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.loginText),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: MyColors.loginText),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          child: Icon(
                            Icons.lock,
                            color: MyColors.loginIcons,
                          ),
                        ),
                        suffixIcon: new GestureDetector(
                          onTap: () {
                            setState(() {
                              _passwordHidden = !_passwordHidden;
                            });
                          },
                          child: Icon(
                            _passwordHidden ?
                            Icons.visibility :
                            Icons.visibility_off,
                            color: MyColors.loginVisibility,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Login Button
                  Container(
                    padding: EdgeInsets.only(
                        top: 55.0
                    ),
                    width: double.infinity,
                    child: RaisedButton(
                      elevation: 1,
                      color: MyColors.loginButton,
                      padding: EdgeInsets.all(22.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      onPressed: _login,
                      child: Text(
                          "Connexion".toUpperCase(),
                          style: TextStyle(
                              fontSize: 20,
                              color: MyColors.gradientSecondary,
                              fontWeight: FontWeight.w800
                          )
                      ),
                    ),
                  ),

                  // Forgot password
                  Container(
                    padding: EdgeInsets.only(
                        top: 50.0
                    ),
                    child: GestureDetector(
                      onTap: () {
                        _forgotPassword();
                      },
                      child: Text(
                        "Vous avez oublié vos identifiants de connexion? Obtenez de l'aide pour vous connecter.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: MyColors.loginForgotPassword,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}