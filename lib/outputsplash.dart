import 'package:flutter/material.dart';
import 'output1.dart';
import 'HTTPHelper.dart';

class OutputSplashScreen extends StatefulWidget {
  final response;

  OutputSplashScreen({required this.response});

  // Future<void> main() async {
  //   final bool test = await HTTPHelper().addFood();
  // }

  @override
  State<StatefulWidget> createState() => _OutputSplashScreenState();
}

class _OutputSplashScreenState extends State<OutputSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OutputPage1(result: widget.response)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/food.jpg"),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("You get" + widget.response),
                Text(
                  "You are familiar with A foods, and You are curious about B foods!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Loading...",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ));
  }
}
