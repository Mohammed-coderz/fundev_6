import 'package:flutter/material.dart';

import '../core/utils/shared_preferences_helper.dart';

class DataScreen extends StatefulWidget {
  const DataScreen({super.key});

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  String? id;
  String? userName;
  String? email;
  String? phone;
  String? role;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getDate();
  }

  Future<void> getDate () async {
    id = await SharedPreferencesHelper.getString("id");
    userName = await SharedPreferencesHelper.getString("username");
    email = await SharedPreferencesHelper.getString("email");
    phone = await SharedPreferencesHelper.getString("phone");
    role = await SharedPreferencesHelper.getString("role");
    print("id is : $id");
    print("userName is : $userName");
    print("email is : $email");
    print("phone is : $phone");
    print("role is : $role");
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("id is : $id"),
            Text("userName is : $userName"),
            Text("email is : $email"),
            Text("phone is : $phone"),
            Text("role is : $role"),
            ElevatedButton(onPressed: (){getDate();}, child: Text("refresh"))
          ],
        ),
      ),
    );
  }
}
