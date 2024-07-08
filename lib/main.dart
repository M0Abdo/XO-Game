import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:xo2/computer.dart';
import 'package:xo2/friend.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Colors.deepPurpleAccent,
          Color.fromARGB(255, 109, 85, 152)
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Text(
              "XO GAME",
              style: TextStyle(fontSize: 60, fontFamily: "frist"),
            ),
            Text(
              "TIC TAC TOE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  fontFamily: "second"),
            ),
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundColor: Colors.white,
              child: Image.asset(
                "assets/xo.png",
                height: 300,
              ),
              radius: 170,
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => friend(),
                ));
              },
              child: Text(
                "Play VS Friend",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "second"),
              ),
              style:
                  ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(290, 50))),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => computer(),
                ));
              },
              child: Text(
                "Play VS Computer",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: "second"),
              ),
              style:
                  ButtonStyle(fixedSize: WidgetStatePropertyAll(Size(290, 50))),
            )
          ],
        ),
      ),
    );
  }
}
