import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foodeul/outputsplash.dart';
import 'input.dart';
import 'controller.dart';
import 'package:get/get.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

// class CustomTextFormFieldState extends State<CustomTextFormField> {
//   FocusNode _focusNode;

//   @override
//   void initState() {
//     super.initState();
//     _focusNode = FocusNode();
//   }

//   @override
//   void dispose() {
//     _focusNode.dispose();
//     super.dispose();
//   }
// }

class _FormPageState extends State<FormPage> {
  TextEditingController CtrlTextFormField = TextEditingController();
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final TextEditingController _famCountryController = TextEditingController();
    final TextEditingController _curCountryController = TextEditingController();
    final TextEditingController _favDishController = TextEditingController();
    final TextEditingController _dislikeIngredientController =
        TextEditingController();

    return Scaffold(
        resizeToAvoidBottomInset: true,
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Color(0xFFffffff),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Form(
            key: formKey, //key for form
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: height * 0.04),
                Text(
                  "Welcome to",
                  style:
                      TextStyle(fontSize: 34, color: const Color(0xffFF8A00)),
                ),
                Text(
                  "Foodeul !",
                  style:
                      TextStyle(fontSize: 34, color: const Color(0xffFF8A00)),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                    controller: _famCountryController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      labelText: "Familiar country",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 78, 43, 2)),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                    controller: _curCountryController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      labelText: "Curious country",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 78, 43, 2)),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                    controller: _favDishController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      labelText: "Your favourite dish",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 78, 43, 2)),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                TextFormField(
                    controller: _dislikeIngredientController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(0)),
                        borderSide:
                            BorderSide(color: Color(0xffFF8A00), width: 6),
                      ),
                      labelText: "Ingredient you don't like",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(255, 78, 43, 2)),
                    )),
                SizedBox(
                  height: height * 0.05,
                ),
                // Row(
                //   // Icon: Container(
                //   //   width: 40,
                //   //   height: 40,
                //   //   color: const Color(0xffFF8A00),
                //   //   margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                //   //   child: IconButton(
                //   //     onPressed: () {
                //   //       Navigator.push(
                //   //         context,
                //   //         MaterialPageRoute(
                //   //             builder: (context) => const HomePage3()),
                //   //       );
                //   //     },
                //   //     icon: Container(
                //   //         width: double.infinity,
                //   //         height: double.infinity,
                //   //         child: Image.asset(
                //   //           "assets/images/arrow_button.png",
                //   //           fit: BoxFit.fill,
                //   //         )),
                //   //     padding: const EdgeInsets.all(0),
                //   //   ),
                //   // ),
                // )
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffFF8A00), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {
                    var input = Input(
                      famCountry:
                          _famCountryController.text.toString().toLowerCase(),
                      curCountry:
                          _curCountryController.text.toString().toLowerCase(),
                      favDish: _favDishController.text.toString().toLowerCase(),
                      dislikeIngredient: _dislikeIngredientController.text
                          .toString()
                          .toLowerCase(),

                      // famCountry: 'vietnam',
                      // curCountry: 'vietnam',
                      // favDish: 'pho',
                      // dislikeIngredient: 'mushroom',
                    );
                    debugPrint(input.famCountry);
                    debugPrint(input.curCountry);
                    debugPrint(input.favDish);
                    debugPrint(input.dislikeIngredient);
                    // final response;

                    // if (input.famCountry == "korea" &&
                    //     input.curCountry == "korea") {
                    //   response = await baseClient().post('/category1', input);
                    //   if (response == null) return;
                    //   debugPrint('Cat1 success');
                    // } else if (input.famCountry == "vietnam" &&
                    //     input.curCountry == "vietnam") {
                    //   response = await baseClient().post('/category2', input);
                    //   if (response == null) return;
                    //   debugPrint('Cat2 success');
                    // } else if (input.famCountry == "korea" &&
                    //     input.curCountry == "vietnam") {
                    //   response = await baseClient().post('/category3', input);
                    //   if (response == null) return;
                    //   debugPrint('Cat3 success');
                    // } else {
                    //   response = await baseClient().post('/category4', input);
                    //   if (response == null) return;
                    //   debugPrint('Cat4 success');
                    // }

                    // var dishesJson = jsonDecode(response)['dishes'];
                    // List<String>? dishes =
                    //     dishesJson != null ? List.from(dishesJson) : null;

                    // print(dishes);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            OutputSplashScreen(input: input)));

                    // Get.to(OutputSplashScreen(input: input));
                  },
                  child: const Text('Submit', style: TextStyle(fontSize: 17)),
                )
              ],
            ),
          ),
        ));
  }
}
