import 'package:first_project/local_storage/local_data.dart';
import 'package:first_project/screens/torch.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const new({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Screen')),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: key,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to our app',
                style: TextStyle(fontSize: 22, color: Colors.blue),
              ),
              SizedBox(height: 10),

              CustomTextField(
                controller: emailController,
                errorMsg: 'Enter your Email',
                label: 'Email',
                title: 'Email',
                isEmail: true,
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),
              CustomTextField(
                controller: passwordController,
                errorMsg: 'Enter your password',
                isPassword: true,
                label: 'Password',
                title: 'Password',

                icon: Icons.password,
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    fixedSize: Size(200, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(16),
                    ),
                  ),

                  onPressed: () {
                    if (key.currentState!.validate()) {
                      MyLocalStorage().setEmail(emailController.text);
                      MyLocalStorage().setPassword(passwordController.text);
                      Navigator.pushReplacementNamed(
                        context,
                        '/product',
                        arguments: {
                          'email': emailController.text,
                          'password': passwordController.text,
                        },
                      );
                    }

                    //!
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 50),
              Center(
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyFlashApp()),
                    );
                  },
                  icon: Icon(Icons.flashlight_on_outlined, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
