import 'package:flutter/material.dart';
import 'package:untitled4/model/user_model.dart';

import '../core/const/colors.dart';

class ListViewScreen extends StatefulWidget {
  const ListViewScreen({super.key});

  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
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
    ),UserModel(
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
    ),UserModel(
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
    ),UserModel(
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
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView'),
        centerTitle: true,
        backgroundColor: COLORs.Primaru,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("data")),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("home"),
              onTap: () {},
              // trailing: Icon(Icons.abc),
            ),
            ExpansionTile(
              leading: Icon(Icons.settings),
              title: Text("settings"),
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("home"),
                  onTap: () {},
                  // trailing: Icon(Icons.abc),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("home"),
                  onTap: () {},
                  // trailing: Icon(Icons.abc),
                ),

                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("home"),
                  onTap: () {},
                  // trailing: Icon(Icons.abc),
                ),
              ],
            ),
            ListTile(leading: Icon(Icons.search), title: Text("search")),
          ],
        ),
      ),

      body: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (context, index) {
          return Divider();
        },
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  users[index].ImageURL ?? "assets/images/logo.jpeg",
                ),
              ),
              title: Text(users[index].name ?? "-"),
              subtitle: Text(users[index].email ?? "-"),
            ),
          );
          // return Container(
          //   height: 100,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(50),
          //     color: Colors.orange,
          //   ),
          //   child:Center(
          //     child: Row(
          //       crossAxisAlignment: CrossAxisAlignment.center,
          //       mainAxisAlignment: MainAxisAlignment.spaceAround,
          //       children: [
          //         CircleAvatar(
          //           backgroundImage: AssetImage(
          //             users[index].ImageURL ?? "assets/images/logo.jpeg",
          //           ),
          //         ),
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //
          //           children: [
          //             Text(users[index].name ?? "-"),
          //             Text(users[index].email ?? "-")
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
