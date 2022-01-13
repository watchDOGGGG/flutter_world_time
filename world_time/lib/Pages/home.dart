import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as dynamic;
    String dateTime = data['isDaytime']? 'night.jpg': 'night.jpg';
    var bgColor = data['isDaytime'] ? Colors.blue[700] : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/$dateTime'),
                fit: BoxFit.cover,
              ),

            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
              child: Column(
                children: [
                  FlatButton.icon(onPressed: (){
                    Navigator.pushNamed(context, '/location');
                  },
                      icon: Icon(Icons.edit_location),
                      label: Text("Edit location")
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          letterSpacing: 2.0,
                          fontSize: 20.0
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    data['time'],
                    style: TextStyle(
                        fontSize: 66.0
                    ),
                  )
                ],
              ),
            ),
          )
      
      ),
    );
  }
}
