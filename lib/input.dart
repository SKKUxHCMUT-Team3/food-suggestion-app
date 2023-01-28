import 'dart:convert';

List<Input> inputFromJson(String str) =>
    List<Input>.from(json.decode(str).map((x) => Input.fromJson(x)));

String inputToJson(List<Input> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Input {
  Input({
    this.famCountry,
    this.curCountry,
    this.favDish,
    this.dislikeIngredient,
  });

  String? famCountry;
  String? curCountry;
  String? favDish;
  String? dislikeIngredient;

  factory Input.fromJson(Map<String, dynamic> json) => Input(
        famCountry: json['famCountry'],
        curCountry: json['curCountry'],
        favDish: json['favDish'],
        dislikeIngredient: json['dislikeIngredient'],
      );

  Map<String, dynamic> toJson() => {
        "famCountry": famCountry,
        "curCountry": curCountry,
        "favDish": favDish,
        "dislikeIngredient": dislikeIngredient,
      };
}
