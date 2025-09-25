import 'package:flutter/material.dart';

import '../model/user_model.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<UserModel> users = [
    UserModel(
      id: 1,
      name: "mohammed",
      email: "mhmd@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 2,
      name: "sameer",
      email: "sameer@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 3,
      name: "yousef",
      email: "yousef@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 4,
      name: "anas",
      email: "anas@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 1,
      name: "mohammed",
      email: "mhmd@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 2,
      name: "sameer",
      email: "sameer@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 3,
      name: "yousef",
      email: "yousef@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 4,
      name: "anas",
      email: "anas@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 1,
      name: "mohammed",
      email: "mhmd@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 2,
      name: "sameer",
      email: "sameer@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 3,
      name: "yousef",
      email: "yousef@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 4,
      name: "anas",
      email: "anas@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 1,
      name: "mohammed",
      email: "mhmd@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 2,
      name: "sameer",
      email: "sameer@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 3,
      name: "yousef",
      email: "yousef@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 4,
      name: "anas",
      email: "anas@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 1,
      name: "mohammed",
      email: "mhmd@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 2,
      name: "sameer",
      email: "sameer@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 3,
      name: "yousef",
      email: "yousef@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 4,
      name: "anas",
      email: "anas@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 1,
      name: "mohammed",
      email: "mhmd@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 2,
      name: "sameer",
      email: "sameer@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 3,
      name: "yousef",
      email: "yousef@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 4,
      name: "anas",
      email: "anas@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
    UserModel(
      id: 1,
      name: "mohammed",
      email: "mhmd@email.com",
      ImageURL: "assets/images/logo.jpeg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("grid view"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //   crossAxisCount: 6,
        // ),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
        ),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(child: Center(child: Text('index : $index')));
        },
      ),
    );
  }
}
