import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:enlacebooking/screen_home.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 100),
            Image.asset(
              'assets/images/enlacebooking.png',
              width: 400,
              color: Color.fromARGB(255, 246, 245, 245),
            ),
            const SizedBox(height: 50),
            TextField(
              controller: _emailController,
              textAlign: TextAlign.left,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Email',
                prefixIcon: Icon(Icons.person),
              ),
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              textAlign: TextAlign.left,
              //obscureText: true,
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.key),
              ),
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _registerUser,
              style: OutlinedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 237, 237, 232)),
              icon: const Icon(Icons.arrow_circle_right_rounded),
              label: const Text('Iniciar sesión'),
            ),
            const SizedBox(height: 50),
            Text(
              '¡Hazlo realidad!',
              style: GoogleFonts.quicksand(
                color: Color.fromARGB(170, 249, 249, 249),
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _registerUser() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final url = Uri.parse('https://testing.aloztre.com/api/token');

    try {
      final response = await http.post(
        url,
        body: {
          'email': email,
          'password': password,
          'device_name': 'postman',
        },
      );

      if (response.statusCode == 200) {
        // Registration was successful.
        final token = response.body;
        print('Registration Successful: $token');
        print('Successful 200 Status Code');
        Navigator.of(context).pushReplacement(
          // Use pushReplacement to replace the current screen
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        // Handle registration error
        print('Registration Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors.
      print('Error: $error');
    }
  }
}
