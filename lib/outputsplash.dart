import 'dart:convert';
import 'package:flutter/material.dart';
import 'input.dart';
import 'output1.dart';
import 'controller.dart';

class OutputSplashScreen extends StatefulWidget {
  // const OutputSplashScreen({super.key});
  Input input;
  // List<String> response;
  // final VoidCallback onInitializationComplete;

  // OutputSplashScreen(
  //     {required this.response,
  //     required this.input,
  //     required this.onInitializationComplete});
  OutputSplashScreen({required this.input});

  @override
  State<StatefulWidget> createState() => _OutputSplashScreenState();
}

class _OutputSplashScreenState extends State<OutputSplashScreen> {
  @override
  void initState() {
    super.initState();
    // _initializeAsyncDependencies();
    handleSplashscreen();

    // Future.delayed(
    //   const Duration(seconds: 4),
    //   () => Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) => OutputPage1(response: widget.input)),
    //   ),
    // );
  }

  // Future<void> _initializeAsyncDependencies() async {
  //   // >>> initialize async dependencies <<<
  //   // >>> register favorite dependency manager <<<
  //   // >>> reap benefits <<<
  //   Future.delayed(
  //     Duration(milliseconds: 1500),
  //     () => widget.onInitializationComplete(),
  //   );
  // }

  void handleSplashscreen() async {
    // Wait for async to complete
    List<String>? dishes = await fetchResult();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OutputPage1(response: List<String>.from(dishes!))));
  }

  Future<List<String>?> fetchResult() async {
    // Do some Network or other stuff
    final response;

    if (widget.input.famCountry == "korea" &&
        widget.input.curCountry == "korea") {
      response = await baseClient().post('/category1', widget.input);
      // if (response == null) return;
      debugPrint('Cat1 success');
    } else if (widget.input.famCountry == "vietnam" &&
        widget.input.curCountry == "vietnam") {
      response = await baseClient().post('/category2', widget.input);
      // if (response == null) return;
      debugPrint('Cat2 success');
    } else if (widget.input.famCountry == "korea" &&
        widget.input.curCountry == "vietnam") {
      response = await baseClient().post('/category3', widget.input);
      // if (response == null) return;
      debugPrint('Cat3 success');
    } else {
      response = await baseClient().post('/category4', widget.input);
      // if (response == null) return;
      debugPrint('Cat4 success');
    }

    var dishesJson = jsonDecode(response)['dishes'];
    final List<String>? dishes =
        dishesJson != null ? List.from(dishesJson) : null;

    print(dishes);

    return dishes;

    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (context) =>
    //         OutputPage1(response: List<String>.from(dishes!))));
  }

  @override
  Widget build(BuildContext context) {
    // return FutureBuilder(
    //     future: _processingData(),
    //     builder: (BuildContext context, AsyncSnapshot snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting)
    //         return _splashUI();

    //       ///Splash Screen
    //       else {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) =>
    //                     OutputPage1(response: widget.response)));
    //       }
    //     });
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
              children: const [
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

  // Widget _splashUI() {
  //   return MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: Scaffold(
  //         body: Container(
  //           width: double.infinity,
  //           height: double.infinity,
  //           decoration: const BoxDecoration(
  //             image: DecorationImage(
  //               fit: BoxFit.fill,
  //               image: AssetImage("assets/images/food.jpg"),
  //             ),
  //           ),
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: const [
  //               Text(
  //                 "You are familiar with A foods, and You are curious about B foods!",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 10,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //               Text(
  //                 "Loading...",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 30,
  //                 ),
  //                 textAlign: TextAlign.center,
  //               ),
  //             ],
  //           ),
  //         ),
  //       ));
  // }

  // Future<dynamic> _fetchResult() async {
  //   final response;
  //   if (widget.input.famCountry == "korea" &&
  //       widget.input.curCountry == "korea") {
  //     response = await baseClient().post('/category1', widget.input);
  //     // if (response == null) return;
  //     debugPrint('Cat1 success');
  //   } else if (widget.input.famCountry == "vietnam" &&
  //       widget.input.curCountry == "vietnam") {
  //     response = await baseClient().post('/category2', widget.input);
  //     // if (response == null) return;
  //     debugPrint('Cat2 success');
  //   } else if (widget.input.famCountry == "korea" &&
  //       widget.input.curCountry == "vietnam") {
  //     response = await baseClient().post('/category3', widget.input);
  //     // if (response == null) return null;
  //     debugPrint('Cat3 success');
  //   } else {
  //     response = await baseClient().post('/category4', widget.input);
  //     // if (response == null) return;
  //     debugPrint('Cat4 success');
  //   }

  //   var dishesJson = jsonDecode(response)['dishes'];
  //   List<String>? dishes = dishesJson != null ? List.from(dishesJson) : null;
  //   return dishes;
  // }

  // Future<dynamic> _processingData() {
  //   return Future.wait[_fetchResult()];
  // }
}
