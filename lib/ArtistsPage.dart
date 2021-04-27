import 'package:flutter/material.dart';
import 'package:albums_route/fetch_file.dart' as fetch_file;
import 'dart:convert';




class ArtistsPage extends StatefulWidget {
  static const routeName = '/artists';
  static List artists= [];
  
  

  ArtistsPage({Key key}) : super(key: key);

  @override
  _ArtistsPageState createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {

  String jsCode;  
  var filePath = 'assets/artists.json';  




  Future<void> getDta() async {    
      fetch_file.fetchFileFromAssets(filePath).then((vale){
        jsCode = vale;     
        print(jsCode);          
        this.setState(() {
          ArtistsPage.artists = jsonDecode(jsCode);
        });        
      });
    }
  
  @override
  void initState() {
    super.initState();
      this.getDta();
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: customDrawer(context: context, pageNumber: 0),
      appBar: AppBar(
        title: Text("Artists"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ 
        Expanded(
          child: ListView.builder(
            itemCount: ArtistsPage.artists.length,            
            itemBuilder: (context, index) {
              return GestureDetector(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                    child: Text(
                      ArtistsPage.artists[index]["name"],
                      style: TextStyle(fontSize: 18),
                    ),
                ),  

                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/about', 
                    arguments: {
                      'name': ArtistsPage.artists[index]["name"],
                      'text': ArtistsPage.artists[index]["about"]
                      });                  
                }
              );      
            }            
          )
        ),      
        ]
      )
    );
  }
 
  }


Drawer customDrawer({BuildContext context, int pageNumber}){
  return Drawer(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
             Navigator.of(context).pushNamed('/');
          },
          child: Container(
            color: pageNumber == 0 ? Colors.blue : Colors.white,
            height: 50,
            child: Center(child: Text("Home")),
          ),
        ),
        SizedBox(height: 30,),
        GestureDetector(
          onTap: (){
           Navigator.of(context).pushNamed('/artists');
          },
          child: Container(
            color: pageNumber == 1 ? Colors.blue : Colors.white,
            height: 50,
            child: Center(child: Text("Albums")),
          ),
        ),
      ],
    ),
  );
}