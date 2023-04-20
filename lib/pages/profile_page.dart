import 'package:efood_flutter/components/head_profile.dart';
import 'package:efood_flutter/components/header.dart';
import 'package:efood_flutter/pages/login_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _inputAllergies = '';
  bool _success = false;
  bool _error = false;

  void _save() {
    if (_formKey.currentState!.validate()) {
      // Call an async function to update the user's profile
      _success = true;
    }
  }

  void _logout() {
    // Call an async function to log out the user
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  void initState() {
    super.initState();
    // Call an async function to get the user's profile and set the initial values of the form
    _name = "John Doe";
    _email = "johndoe@example.com";
    _password = "password";
    _inputAllergies = "Peanuts, Shellfish";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderProfile(),
      backgroundColor: Color(0xffbdbdbd),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Text(
                    '🍔 DeFood',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                Center(
                    child: Text(
                  'Email',
                  style: TextStyle(fontSize: 20),
                )),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration:
                      InputDecoration(filled: true, fillColor: Colors.white),
                  initialValue: _email,
                  enabled: false,
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  'Name',
                  style: TextStyle(fontSize: 20),
                )),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  initialValue: _name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  'Password',
                  style: TextStyle(fontSize: 20),
                )),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration:
                      InputDecoration(filled: true, fillColor: Colors.white),
                  initialValue: _password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _password = value!;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: Text(
                  'Allergies, separated by comma',
                  style: TextStyle(fontSize: 20),
                )),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration:
                      InputDecoration(filled: true, fillColor: Colors.white),
                  initialValue: _inputAllergies,
                  onChanged: (value) {
                    _inputAllergies = value;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text('Save'),
                  onPressed: _save,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: Text(
                    'Logout',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: _logout,
                ),
                if (_error)
                  Text(
                    'An error occurred while saving your changes',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                if (_success)
                  Text(
                    'Changes saved',
                  )
              ]),
        ),
      ),
    );
  }
}
