import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'home4.dart';

class HomePage3 extends StatefulWidget {
  const HomePage3({super.key});

  @override
  State<HomePage3> createState() => _HomePage3State();
}

class _HomePage3State extends State<HomePage3> {
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
              "Your favorite food",
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
                  controller: CtrlTextFormField,
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
                    hintText: "input foo",
                    suffixIcon: Container(
                      width: 40,
                      height: 40,
                      color: const Color(0xffFF8A00),
                      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage4()),
                          );
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
                  ),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
