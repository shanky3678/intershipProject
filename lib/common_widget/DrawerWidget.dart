import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/components/AboutUs.dart';
import 'package:pink_flamingo_app/components/AppSignIn.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pink_flamingo_app/models/OrderView.dart';
import 'package:pink_flamingo_app/screens/HomeScreen.dart';

class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createDrawerHeader(),
            // _createDrawerItem(
            //     icon: Icons.home,
            //     text: 'Home',
            //     onTap: () {
            //       Navigator.pop(context);
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => HomeScreen()),
            //       );
            //     }),
            _createDrawerItem(
                icon: FontAwesomeIcons.user,
                text: 'View Orders',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderView(slug: "get-orders")),
                  );
                }),
            _createDrawerItem(
                icon: Icons.shop,
                text: 'About us',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutUs()));
                }),
            _createDrawerItem(
                icon: Icons.logout,
                text: 'Sign out',
                onTap: () {
                  Navigator.popUntil(context, (route) => false);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AppSignIn()));
                })
          ],
        ),
      ),
    );
  }
}

Widget _createDrawerHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Image.asset(
              'assets/images/pink.png',
              width: 130,
              height: 130,
            ),
          ),
        ),
      ]));
}

Widget _createDrawerItem(
    {IconData icon, String text, GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(
          icon,
          color: Color(0xFF808080),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            text,
            style: TextStyle(color: Color(0xFF484848)),
          ),
        )
      ],
    ),
    onTap: onTap,
  );
}
