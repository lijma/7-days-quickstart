import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(LoginView());

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Login Demo View",
        home: Scaffold(
          body: SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                const SizedBox(height: 80.0),
                Column(
                  children: <Widget>[
                    Image.asset('assets/diamond.png'),
                    const SizedBox(height: 16.0),
                    const Text('SHRINE'),
                  ],
                ),
                const SizedBox(height: 120.0),
                // TODO: Remove filled: true values (103)
                TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Username2',
                  ),
                ),
                const SizedBox(height: 12.0),
                TextField(
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 12.0),
                OverflowBar(
                  alignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // TODO: Add a beveled rectangular border to CANCEL (103)
                    TextButton(
                      child: const Text('CANCEL'),
                      onPressed: () {
                      },
                    ),
                    // TODO: Add an elevation to NEXT (103)
                    // TODO: Add a beveled rectangular border to NEXT (103)
                    ElevatedButton(
                      child: const Text('NEXT'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          )
        )
    );
  }
}
