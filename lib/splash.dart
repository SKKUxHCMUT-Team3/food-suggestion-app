import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 4),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
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
              image: AssetImage("assets/images/dog.jpg"),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text("Foodeul", style: TextStyle(color: Colors.white, fontSize: 100,), textAlign: TextAlign.center,),
              Text("that you like,\nbut you don't know", style: TextStyle(color: Colors.white, fontSize: 30,), textAlign: TextAlign.center,),
            ],
          ),
        ),
      )
    );
  }
}
