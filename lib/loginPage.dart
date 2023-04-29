import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginpage/homePage.dart';
import 'package:loginpage/validator.dart';


String error = "Oops! wrong email id or password.";


class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  //This key will be used to identify the state of the form.
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('LOGIN PAGE', style: TextStyle(fontSize: 50)),
        ),
      ),
      body: SafeArea(
        child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(
                          Icons.person,
                          size: 50,
                        ),
                        hintText: 'xyz@gmail.com',
                        hintStyle: TextStyle(fontSize: 50),
                        labelText: 'Email *',
                        labelStyle: TextStyle(fontSize: 50),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Field is required.';
                        String pattern = r'\w+@\w+\.\w+';
                        if (!RegExp(pattern).hasMatch(value))
                          return 'Invalid E-mail Address format.';
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          icon: Icon(
                            Icons.password,
                            size: 50,
                          ),
                          hintText: 'enter the password',
                          hintStyle: TextStyle(fontSize: 50),
                          labelText: 'Password *',
                          labelStyle: TextStyle(fontSize: 50),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty)
                            return 'Field is required.';
                          String pattern =
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                          if (!RegExp(pattern).hasMatch(value))
                            return '''
                            Password must be at least 8 characters,
                            include an uppercase letter, number and symbol.
                            ''';
                          return null;
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            //_formKey.currentState!.save();
                            print("form submitted.");

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => homePage()));
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(fontSize: 50),
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    //_formKey.currentState!.validate() ? Text("") :Text(error),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot my password",
                          style: TextStyle(fontSize: 50),
                        )),
                  ],
                ))),
      ),
    );
  }
}
