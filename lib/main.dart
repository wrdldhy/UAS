import 'package:vity/menu/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: LoginForm(),
  ));
}

class LoginForm extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();
  final Map<String, dynamic> formData = {'email': '', 'password': ''};
  final focusPassword = FocusNode();

  LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: _formkey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Planner'),
        ),
        body: Column(
          children: [
            const SizedBox(height: 200),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!)) {
                    return "Invalid email!";
                  }
                },
                onSaved: (value) {
                  formData['email'] = value;
                },
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (value) {
                  FocusScope.of(_formkey.currentContext!).requestFocus();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(labelText: 'Password'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required!";
                  }
                },
                onSaved: (value) {
                  formData['Password'] = value;
                },
              ),
            ),
            const SizedBox(height: 13),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color.fromARGB(255, 66, 135, 245),
                          Color.fromARGB(255, 66, 135, 245),
                          Color.fromARGB(255, 66, 135, 245),
                        ],
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Wbn()));
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 66, 135, 245),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                        letterSpacing: 2, color: Colors.white, fontSize: 20),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
