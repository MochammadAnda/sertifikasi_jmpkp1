import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sertifikasi_jpm_kp1/auth_provider.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: null,
        flexibleSpace: Center(
          child: Text(
            'Login Page',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
        toolbarHeight: 90, // Mengatur tinggi AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String username = _usernameController.text;
                String password = _passwordController.text;
                Provider.of<AuthProvider>(context, listen: false)
                    .login(username, password);
                if (Provider.of<AuthProvider>(context, listen: false)
                    .isAuthenticated) {
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Invalid username or password'),
                  ));
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
