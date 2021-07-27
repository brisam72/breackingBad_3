import 'dart:core';



class Character {
  late int charId;
  late String name;
  late String nikName;
  late String imag;
  late List<dynamic> jobs; 
  late String status;
  late List<dynamic> appearance;
  late String actorName;
  late String category;
  late List<dynamic> betterCallSaulAppearance;
  Character(
      {required this.charId,
      required this.name,
      required this.nikName,
      required this.imag,
      required this.jobs,
      required this.status,
      required this.appearance,
      required this.actorName,
      required this.category,
      required this.betterCallSaulAppearance});
 
  Character.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    nikName = json["nickname"];
    imag = json["img"];
    jobs = json["occupation"];
    status = json["status"];
    appearance = json["appearance"];
    actorName = json["portrayed"];
    category = json["category"];
    betterCallSaulAppearance = json["better_call_saul_appearance"];
  }
}
