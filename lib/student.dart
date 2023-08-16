/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

Student studentFromJson(String str) => Student.fromJson(json.decode(str));

String studentToJson(Student data) => json.encode(data.toJson());

class Student {
    Student({
        required this.college,
        required this.name,
        required this.rollno,
     //   required this.id,
        required this.admno,
    });


  String college;
    String name;
    int rollno;
   // String id;
    int admno;

    factory Student.fromJson(Map<dynamic, dynamic> json) => Student(
        college: json["college"],
        name: json["name"],
        rollno: json["rollno"],
      //  id: json["_id"],
        admno: json["admno"],
    );

    Map<dynamic, dynamic> toJson() => {
        "college": college,
        "name": name,
        "rollno": rollno,
       // "_id": id,
        "admno": admno,
    };
}
