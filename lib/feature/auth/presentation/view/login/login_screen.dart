import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled4/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:untitled4/feature/auth/presentation/state/login_state.dart';
import '../../../../../core/const/png.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                PNGs.logo,
                width: width * 1,
                height: height * 0.3,
                fit: BoxFit.cover,
              ),
              SizedBox(height: height * 0.02),
              Text(
                "welcome back !",
                style: TextStyle(color: Colors.amber, fontSize: 25),
              ),
              SizedBox(height: height * 0.02),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    label: Text("Email"),
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
                  obscureText: isPassword,
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(isPassword ? Icons.visibility : Icons.abc),
                    ),
                    label: Text("Password"),
                    hintText: "please enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: height * 0.04),
              BlocConsumer<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state is OnLoadingLoginState) {
                    return CircularProgressIndicator();
                  } else if (state is OnErrorLoginState) {
                    return Text(state.errorMessage);
                  } else if (state is OnLoadedLoginState) {
                    return InkWell(
                      onTap: () async {
                        await context.read<LoginCubit>().Login(
                          phone: emailController.text,
                          password: passwordController.text,
                        );
                      },
                      child: Container(
                        height: height * 0.05,
                        width: width * 0.44,
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("login")),
                      ),
                    );
                  }
                  return SizedBox();
                },
                listener: (context, state) {},
              ),
              SizedBox(height: height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("don't have an account ?"),
                  TextButton(
                    onPressed: () {
                      print("sign up");
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SignupScreen()),
                      // );
                    },
                    child: Text("sign up"),
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
