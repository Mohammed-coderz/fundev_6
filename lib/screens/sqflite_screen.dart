import 'package:flutter/material.dart';

class SqfliteScreen extends StatefulWidget {
  const SqfliteScreen({super.key});

  @override
  State<SqfliteScreen> createState() => _SqfliteScreenState();
}

class _SqfliteScreenState extends State<SqfliteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sqflite"),
        centerTitle: true,
      ),
      body: Center(),
    );
  }
}
