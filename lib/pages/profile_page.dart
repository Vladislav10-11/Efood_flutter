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
    Navigator.pushNamed(context, '/login');
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
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  '🍔 DeFood',
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  initialValue: _email,
                  enabled: false,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
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
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
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
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Allergies, separated by comma'),
                  initialValue: _inputAllergies,
                  onChanged: (value) {
                    _inputAllergies = value;
                  },
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  child: Text('Save'),
                  onPressed: _save,
                ),
                ElevatedButton(
                  child: Text('Logout'),
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
