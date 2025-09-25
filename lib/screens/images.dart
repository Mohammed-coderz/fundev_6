import 'package:flutter/material.dart';

class Images extends StatelessWidget {
  const Images({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Images'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: Icon(Icons.abc),
            ),
            Image.network(
              "https://tse2.mm.bing.net/th/id/OIP.cf9DpeqXVSPyqTrd8V9YNQHaDt?cb=thfvnext&rs=1&pid=ImgDetMain&o=7&rm=3",
              width: width * 0.8,
              height: height * 0.3,
              fit: BoxFit.contain,
            ),
            Image.asset(
              "assets/images/logo.jpeg",
              width: width * 0.8,
              height: height * 0.3,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
