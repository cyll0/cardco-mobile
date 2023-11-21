// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:cardco/screens/login.dart';

void main() {
    runApp(const RegisterApp());
}

class RegisterApp extends StatelessWidget {
const RegisterApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Register',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const RegisterPage(),
    );
    }
}

class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});

    @override
    _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController1 = TextEditingController();
    final TextEditingController _passwordController2 = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Register'),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController1,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        TextField(
                            controller: _passwordController2,
                            decoration: const InputDecoration(
                                labelText: 'Confirm Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password1 = _passwordController1.text;
                                String password2 = _passwordController2.text;

                                final response = await http.post(
                                  Uri.parse('http://127.0.0.1:8000/register-flutter/'),
                                  headers: <String, String>{
                                    'Content-Type': 'application/json; charset=UTF-8',
                                  },
                                  body: jsonEncode(<String, String>{
                                    'username': username,
                                    'password1': password1,
                                    'password2': password2
                                  }),
                                );

                                if (response.statusCode == 200) {
                                  String message = "Registration successful!";
                                  String uname = username;
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => const LoginPage()),
                                  );
                                  ScaffoldMessenger.of(context)
                                    ..hideCurrentSnackBar()
                                    ..showSnackBar(
                                      SnackBar(content: Text("$message Welcome, $uname.")),
                                    );
                                } else {
                                  String errorMessage = "";
                                  Map<String, dynamic> responseData = jsonDecode(response.body);

                                  var flag = false;
                                  for (var value in responseData.values) {
                                    String message = value;
                                    if (message == "This field is required.") {
                                      if (!flag) {
                                        message = "Please fill in each field.";
                                      } else {
                                        continue;
                                      }
                                      flag = true;
                                    }
                                    errorMessage += "$message\n";
                                  }
                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      title: const Text('Registration Failed'),
                                      content: Text(errorMessage),
                                      actions: [
                                        TextButton(
                                          child: const Text('OK'),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                  );
                                }
                            },
                            child: const Text('Register'),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("Already have an account?"),
                            TextButton(
                              child: const Text(
                                'Login',
                                style: TextStyle(fontSize: 14),
                              ),
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => const LoginPage()),
                                );
                              },
                            )
                          ],
                        ),
                    ],
                ),
            ),
        );
    }
}