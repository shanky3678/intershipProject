import 'package:flutter/material.dart';
import 'package:pink_flamingo_app/components/CategorySlider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
              child: Container(
                color: Color(0xFFf5f6f7),
              ),
            ),
            PreferredSize(
              preferredSize: Size.fromHeight(50.0),
              child: TabBar(
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Home',
                  ),
                  Tab(
                    text: 'Categories',
                  ),
                  Tab(
                    text: 'New in',
                  )
                ], // list of tabs
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Color(0xFFf5f6f7),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Container(
                    color: Colors.white24,
                    child: CategoryPage(slug: 'products'),
                  ),
                  Container(
                    color: Colors.white24,
                    child: CategoryPage(slug: 'products'),
                  ),
                  Container(
                    color: Colors.white24,
                    child: CategoryPage(slug: 'products'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
