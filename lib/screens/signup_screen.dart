import 'package:flutter/material.dart';
import 'package:untitled4/screens/login_screen.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('signup'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                "https://tse2.mm.bing.net/th/id/OIP.cf9DpeqXVSPyqTrd8V9YNQHaDt?cb=thfvnext&rs=1&pid=ImgDetMain&o=7&rm=3",
                width: width * 1,
                height: height * 0.3,
                fit: BoxFit.cover,
              ),
              SizedBox(height: height * 0.02),
              Text(
                "welcome to our app!",
                style: TextStyle(color: Colors.amber, fontSize: 25),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    label: Text("name"),
                    hintText: "please enter your name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text("email"),
                    hintText: "please enter your email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text("password"),
                    hintText: "please enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    label: Text("confirm Password"),
                    hintText: "please enter your password again",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              InkWell(
                onTap: () {
                  print("login");
                  print("name is : ${nameController.text}");
                  print("email is : ${emailController.text}");
                  print("password is : ${passwordController.text}");
                  print(
                    "confirm password is : ${confirmPasswordController.text}",
                  );
                },
                child: Container(
                  height: height * 0.05,
                  width: width * 0.44,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(child: Text("signup")),
                ),
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("already have an account ?"),
                  TextButton(
                    onPressed: () {
                      print("login");
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    child: Text("login "),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
