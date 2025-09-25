import 'package:flutter/material.dart';

import '../core/const/colors.dart';

class DrawarScreen extends StatefulWidget {
  const DrawarScreen({super.key});

  @override
  State<DrawarScreen> createState() => _DrawarScreenState();
}

class _DrawarScreenState extends State<DrawarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("drawar screen"),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.abc),
      ),
    );
  }
}
