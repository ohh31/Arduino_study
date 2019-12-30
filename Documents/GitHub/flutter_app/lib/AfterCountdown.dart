import 'package:flutter/material.dart';

class AfterCountdownPage extends StatelessWidget{
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      body:   Center(
        child: RaisedButton(
            child:
            Text('탑승완료', style: TextStyle(fontSize: 24)),
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/Myapp'));
            }
        ),
      ),
    );
  }
}
