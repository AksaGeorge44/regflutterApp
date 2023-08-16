import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;


void main()
{
  runApp(App());
}

void addStudent(Map<String, dynamic> data) async {
  final response = await http.post(
    Uri.parse('http://192.168.0.120:3000/read'), // Replace with your actual URL
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(data), // Send the provided data
  );

  if (response.statusCode == 200) {
    print('Student added successfully');
  } else {
    print('Failed to add student - ${response.statusCode}');
    print(response.body);
  }
}


class App extends StatelessWidget {
  TextEditingController name=TextEditingController();
  TextEditingController rollno=TextEditingController();
  TextEditingController admno=TextEditingController();
  TextEditingController college=TextEditingController();
   App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("App"),
        ),

        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 200),
            child: Column(
              children: [
                SizedBox(height: 20,),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: name,
                    decoration:  InputDecoration(
                      hintText: "enter uname",
                      labelText: "uname",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: rollno,
                    decoration:  InputDecoration(
                      hintText: "enter password",
                      labelText: "password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: admno,
                    decoration:  InputDecoration(
                      hintText: "enter admno",
                      labelText: "admno",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 400,
                  child: TextField(
                    controller: college,
                    decoration:  InputDecoration(
                      hintText: "enter college",
                      labelText: "college",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                ElevatedButton(
                  onPressed: () {
                    // Create a map of data to send in the POST request
                    Map<String, dynamic> data = {
                      'name': name.text,
                      'rollno': rollno.text,
                      'admno': admno.text,
                      'college': college.text,
                    };

                    // Send a POST request to your Node.js server
                    addStudent(data);
                  },
                  child: const Text("OK"),
                ),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
