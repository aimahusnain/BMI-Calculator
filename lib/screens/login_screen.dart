import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bmi_calculator/screens/input_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passwordObscured = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final ageController = TextEditingController();
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff232323),
      //appBar: AppBar(
      //centerTitle: true,
      //automaticallyImplyLeading: false,
      //),

      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.cyan,
            ], // Adjust gradient colors

            //begin: Alignment.topCenter,
            //end: Alignment.bottomCenter,
            //begin: Alignment.centerRight,
            //end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                  height: 300,
                  image: AssetImage(
                    "images/login.png",
                  )),
              Text(
                "Welcome",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    fontFamily: "Baloo",
                    color: Colors.white),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.alternate_email,
                      color: Colors.white,
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: passwordObscured,
                controller: passwordController,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.lock_open,
                      color: Colors.white,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          passwordObscured = !passwordObscured;
                        });
                      },
                      icon: Icon(Icons.visibility_off),
                    ),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 20),
              // TextFormField(
              //   controller: ageController,
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(
              //       icon: Icon(
              //         Icons.height,
              //         color: Colors.white,
              //       ),
              //       hintText: "Age",
              //       hintStyle: TextStyle(color: Colors.white)),
              //   style: TextStyle(color: Colors.white),
              // ),
              // SizedBox(height: 20),
              TextFormField(
                controller: usernameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                    icon: Icon(
                      Icons.shopping_cart_checkout,
                      color: Colors.white,
                    ),
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.white)),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 40),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("email", emailController.text.toString());
                  sp.setString("age", ageController.text.toString());
                  sp.setString("username", usernameController.text.toString());
                  sp.setBool("isLogin", true);

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InputPage()));
                },
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.white, blurRadius: 5)
                        ]),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text('Login',
                          style: TextStyle(fontFamily: "Baloo", fontSize: 33)),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
