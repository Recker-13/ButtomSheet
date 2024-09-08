import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  void _showBottomSheet(BuildContext context, String formType) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: formType == 'login' ? LoginForm() : RegisterForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 32, 2, 69),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Positioned(
                  child: Image.asset(
                    'assets/images/Illustration.png',
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 230, 213, 23),
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: Colors.brown),
                ),
              ),
              onPressed: () => _showBottomSheet(context, 'register'),
              child: Text(
                'Create Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(200, 50),
                side: BorderSide(color: Colors.yellow, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () => _showBottomSheet(context, 'login'),
              child: Text(
                'Login',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 210, 180, 140),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Register',
            style: TextStyle(
              fontSize: 24,
              color: const Color.fromARGB(255, 64, 16, 72),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Username/Email',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2.0),
              ),
              prefixIcon: Icon(Icons.person,
                  color: const Color.fromARGB(255, 85, 22, 96)),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Course',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2.0),
              ),
              prefixIcon: Icon(Icons.book,
                  color: const Color.fromARGB(255, 78, 19, 88)),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2.0),
              ),
              prefixIcon: Icon(Icons.lock,
                  color: const Color.fromARGB(255, 79, 20, 90)),
            ),
            obscureText: true,
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Confirm Password',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2.0),
              ),
              prefixIcon: Icon(Icons.lock,
                  color: const Color.fromARGB(255, 83, 21, 94)),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: const Color.fromARGB(255, 44, 25, 77),
              foregroundColor: Colors.yellow,
            ),
            child: Text('Register'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Already have an account? Login'),
          ),
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 210, 180, 140),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              color: const Color.fromARGB(255, 51, 13, 57),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Username/Email',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2.0),
              ),
              prefixIcon: Icon(Icons.person,
                  color: const Color.fromARGB(255, 85, 21, 97)),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.purple, width: 2.0),
              ),
              prefixIcon: Icon(Icons.lock,
                  color: const Color.fromARGB(255, 68, 17, 77)),
            ),
            obscureText: true,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (bool? value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
              ),
              Text(
                'Remember me',
                style: TextStyle(
                  color: const Color.fromARGB(255, 62, 15, 70),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: Size(double.infinity, 50),
              backgroundColor: const Color.fromARGB(255, 37, 20, 66),
              foregroundColor: Colors.yellow,
            ),
            child: Text('Login'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Forgot Password?'),
          ),
        ],
      ),
    );
  }
}
