
import 'package:flutter/material.dart';
import 'AfterClickBus.dart';
import 'AfterCountdown.dart';
import 'package:http/http.dart' as http;


void main() => runApp(MyApp());

final dummySnapshot = [
  {"name": "200", "time": 5},
  {"name": "205", "time": 14},
  {"name": "105", "time": 11},
  {"name": "100", "time": 10},
  {"name": "50", "time": 1},
];

final TextEditingController _textController = new TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentColor: Colors.red,
      ),
      initialRoute: '/',
      routes: {
        '/Myapp': (context) => MyApp(),
        '/AskPage': (context) => AskPage(),
        '/CountDownTimer': (context) => CountDownTimer(),
        '/AfterCountdownPage': (context) => AfterCountdownPage(),

      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage>{

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Location"),
      ),
      body:_buildList(context),

      );
     }
  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50.0),
      child: TextField(
        controller: _textController,
    //    onSubmitted: _handleSubmitted,
        decoration: new InputDecoration.collapsed(
            hintText: "위치를 검색하세요",
            border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildList(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20.0),
      children: dummySnapshot.map((data) => _buildListItem(context, data))
          .toList(),
    );
  }

  Widget _buildListItem(BuildContext context, Map data) {
    return Padding(
      key: ValueKey(data['name']),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child:
        InkWell(
          child:
          ListTile(
            title: Text("  ${data['name']}번 버스가  ${data['time']} 분 후에 도착합니다"),
            onTap: () {
              Navigator.pushNamed(context, '/AskPage');
            },
          ),
        ),
      ),
    );
  }

}


class User {
  final int userId;
  final String name;
  final String email;
  final String phone;

  final Map<String, dynamic> company;

  User({this.userId, this.name, this.email, this.phone, this.company});


  factory User.fromJson(Map<String, dynamic> userMap) {
    return User(
      userId: userMap['id'],
      name: userMap['name'],
      email: userMap['email'],
      phone: userMap['phone'],
      company: userMap['company'],
    );
  }

}


