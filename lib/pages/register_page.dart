import 'package:efood_flutter/api/auth_api.dart';
import 'package:efood_flutter/api/auth_provider.dart';
import 'package:efood_flutter/components/header.dart';
import 'package:efood_flutter/models/user.dart';
import 'package:efood_flutter/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _repeatPasswordController = TextEditingController();

  bool _busy = false;
  String _error = '';

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _repeatPasswordController.dispose();
    super.dispose();
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      if (_repeatPasswordController.text != _passwordController.text) {
        setState(() {
          _error = 'Passwords do not match';
        });
        return;
      }

      setState(() {
        _busy = true;
        _error = '';
      });

      try {
        await AuthProvider().register(
          name: _nameController.text,
          email: _emailController.text,
          password: _passwordController.text,
        );

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => ProfilePage()),
          ),
        );
      } catch (err) {
        setState(() {
          print(err.toString());
          _error = err.toString();
        });
      }

      setState(() {
        _busy = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(),
      backgroundColor: Color(0xffbdbdbd),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Register',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      hintText: 'Name',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _repeatPasswordController,
                    decoration: InputDecoration(
                      hintText: 'Repeat password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please repeat your password';
                      }
                      return null;
                    },
                  ),
                  ElevatedButton(
                    onPressed: _busy ? null : _register,
                    child: _busy
                        ? CircularProgressIndicator()
                        : Text('Create account'),
                  ),
                  if (_error != null)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        _error,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
