import 'package:flutter/material.dart';
import 'package:albums_route/ArtistsPage.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  static const routeName = '/';


  @override
  _MyHomePageState createState() => _MyHomePageState();
}
 
class _MyHomePageState extends State<MyHomePage> {
     List listTiles = ['Home' 'Artists'];
       List<bool> isSelected = [false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Routes'),
      ),
      drawer: customDrawer(context: context, pageNumber: 0),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Routes',
            ),
          ],
        ),
      ),
    );
  }
}
