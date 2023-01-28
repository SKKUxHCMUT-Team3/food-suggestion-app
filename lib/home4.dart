import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'outputsplash.dart';
import 'package:get/get.dart';

class HomePage4 extends StatefulWidget {
  const HomePage4({super.key});

  @override
  State<HomePage4> createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
  TextEditingController CtrlTextFormField1 = TextEditingController();
  TextEditingController CtrlTextFormField2 = TextEditingController();
  TextEditingController CtrlTextFormField3 = TextEditingController();

  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  var i = 1;

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> CtrlTextFormField = [
      CtrlTextFormField1,
      CtrlTextFormField2,
      CtrlTextFormField3
    ];

    return GetMaterialApp(
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
              "Ingredient you don't like",
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 12,
            ),
            Center(
              child: SizedBox(
                width: 300,
                height: 60,
                child: TextFormField(
                  controller: CtrlTextFormField[0],
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide:
                          BorderSide(color: Color(0xffFF8A00), width: 6),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                      borderSide:
                          BorderSide(color: Color(0xffFF8A00), width: 6),
                    ),
                    // hintText: "input food",
                    suffixIcon: removeButton[removeButton.length - 1],
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            Column(
              children: newWidgets,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton(
                  onPressed: () {
                    if (i <= 2) {
                      setState(() {
                        if (newTexts.isEmpty) {
                          newTexts.add(TextButton(
                            onPressed: () {
                              Get.to(const OutputSplashScreen());
                            },
                            child: const Text("Submit"),
                          ));
                        }
                        if (removeButton.length == 1) {
                          removeButton.add(null);
                        }
                        newWidgets.add(const SizedBox(
                          height: 15,
                        ));
                        newWidgets.add(Center(
                          child: SizedBox(
                            width: 300,
                            height: 60,
                            child: TextFormField(
                              controller: CtrlTextFormField[i],
                              textAlign: TextAlign.center,
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  borderSide: BorderSide(
                                      color: Color(0xffFF8A00), width: 6),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(0)),
                                  borderSide: BorderSide(
                                      color: Color(0xffFF8A00), width: 6),
                                ),
                              ),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ));
                        i++;
                      });
                    }
                  },
                  child: const Text("More")),
              getnewTexts(),
            ]),
          ],
        ),
      ),
    );
  }

  List<Widget> newWidgets = [];
  List<Widget> newTexts = [];
  List removeButton = [
    Container(
      width: 40,
      height: 40,
      color: const Color(0xffFF8A00),
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: IconButton(
        onPressed: () {
          Get.to(const OutputSplashScreen());
        },
        icon: Container(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/images/arrow_button.png",
              fit: BoxFit.fill,
            )),
        padding: const EdgeInsets.all(0),
      ),
    ),
  ];

  Widget getnewTexts() {
    if (newTexts.isNotEmpty) {
      return newTexts[0];
    } else {
      return const SizedBox(
        width: 0,
        height: 0,
      );
    }
  }
}
