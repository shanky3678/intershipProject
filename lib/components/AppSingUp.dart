import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/components/AppSignIn.dart';
import 'package:pink_flamingo_app/services/ApiService.dart';

class AppSingUp extends StatefulWidget {
  @override
  _AppSingUpState createState() => _AppSingUpState();
}

class _AppSingUpState extends State<AppSingUp> {
  TextEditingController _name = TextEditingController();

  TextEditingController _address = TextEditingController();

  TextEditingController _email = TextEditingController();

  TextEditingController _password = TextEditingController();

  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
      body: isBusy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
              width: double.infinity,
              height: double.infinity,
              color: Colors.white70,
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: InkWell(
                        child: Container(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Icon(Icons.close),
                          ),
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    Flexible(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 130,
                            height: 130,
                            alignment: Alignment.center,
                            child: Image.asset("assets/images/pink.png"),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Flexible(
                            flex: 1,
                            child: TextField(
                              controller: _name,
                              showCursor: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                fillColor: Color(0xFFF2F3F5),
                                hintStyle: TextStyle(
                                  color: Color(0xFF666666),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                ),
                                hintText: "Name",
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextField(
                            controller: _email,
                            showCursor: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xFF666666),
                                size: defaultIconSize,
                              ),
                              fillColor: Color(0xFFF2F3F5),
                              hintStyle: TextStyle(
                                  color: Color(0xFF666666),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize),
                              hintText: "Email",
                            ),
                          ),
                          TextField(
                            controller: _password,
                            showCursor: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.password,
                                color: Color(0xFF666666),
                                size: defaultIconSize,
                              ),
                              fillColor: Color(0xFFF2F3F5),
                              hintStyle: TextStyle(
                                  color: Color(0xFF666666),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize),
                              hintText: "Password",
                            ),
                          ),
                          TextField(
                            controller: _address,
                            showCursor: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                borderSide: BorderSide(
                                  width: 0,
                                  style: BorderStyle.none,
                                ),
                              ),
                              filled: true,
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Color(0xFF666666),
                                size: defaultIconSize,
                              ),
                              fillColor: Color(0xFFF2F3F5),
                              hintStyle: TextStyle(
                                  color: Color(0xFF666666),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize),
                              hintText: "Address",
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: double.infinity,
                            child: RaisedButton(
                              padding: EdgeInsets.all(17.0),
                              onPressed: () async {
                                setState(() {
                                  isBusy = true;
                                });

                                if (_name.text.isNotEmpty &&
                                    _password.text.isNotEmpty &&
                                    _email.text.isNotEmpty &&
                                    _address.text.isNotEmpty) {
                                  var result = await create_user("add-user", {
                                    "name": _name.text,
                                    "address": _address.text,
                                    "password": _password.text,
                                    "email": _email.text,
                                  });
                                  if (result.ok) {
                                    print("success status : " +
                                        result.data['status']);
                                  } else {
                                    setState(() {
                                      isBusy = false;
                                    });
                                  }
                                }
                                setState(() {
                                  isBusy = false;
                                });
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: 'Poppins-Medium.ttf',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              color: Color(0xFFBC1F26),
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0),
                                  side: BorderSide(color: Color(0xFFBC1F26))),
                            ),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFFF2F3F7)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "Already have an account? ",
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppSignIn()),
                                );
                              },
                              child: Container(
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                    color: Color(0xFFAC252B),
                                    fontFamily: defaultFontFamily,
                                    fontSize: defaultFontSize,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
