import 'package:flutter/material.dart';

class OutputPage1 extends StatefulWidget {
  final String result;
  OutputPage1({required this.result});

  @override
  State<OutputPage1> createState() => _OutputPage1State();
}

class _OutputPage1State extends State<OutputPage1> {
  TextEditingController CtrlTextFormField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "We recommend these foods...",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(widget.result),
            const SizedBox(
              height: 12,
            ),
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 6,
                  color: const Color(0xffFF8A00),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
