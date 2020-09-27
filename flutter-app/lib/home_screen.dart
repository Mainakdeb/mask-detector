import 'package:flutter/cupertino.dart';

import './face_detection_camera.dart';
import './face_detection_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => new HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>{
  List<bool> _isSelected = [false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Mask Detector'),
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
  
          children: <Widget>[
            Container(
              child: Image.asset("assets/images/image_home_Screen.jpeg",height: 200,width: 200,),
            ),
            Container(
              child: Image.network("https://media2.giphy.com/media/H62aSApQGHPUr0egL5/giphy.gif"),
            ),

            Positioned(
              bottom: 0,
              child: Align(
                child: Padding(
              padding: EdgeInsets.all(16.0),
              child:ToggleButtons(
                children: <Widget>[
                  Icon(Icons.image),
                  Icon(Icons.camera),
                ],
                isSelected: _isSelected,
                onPressed: (int index) {
                  if(index==0){
                    setState(() {
                      if(_isSelected[index+1]==true){
                        _isSelected[index+1]=!_isSelected[index+1];
                      }
                      _isSelected[index] = !_isSelected[index];
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FaceDetectionFromImage(),
                      ),
                    );
  
                  }
                  if(index==1){
                    if(_isSelected[index-1]==true){
                      _isSelected[index-1]=!_isSelected[index-1];
                    }
                    setState(() {
                      _isSelected[index] =! _isSelected[index];
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => FaceDetectionFromLiveCamera(),
                      ),
                    );
                  }
  
                },
  
                color: Colors.black54,
                selectedColor: Colors.black,
                fillColor: Colors.amber,
                // endregion
                // region example 2
                borderColor: Colors.black,
                selectedBorderColor: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
              ),
              ),
            ),
          ],
          ),
      ),
    );
  }
}
