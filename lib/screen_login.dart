import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({required this.onSwitchToHome, super.key});

  final void Function() onSwitchToHome;

  @override
  Widget build(context) {
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
            const TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.amber,
                hoverColor: Colors.deepOrangeAccent,
                labelText: 'Nombre de usuario',
                prefixIcon: Icon(Icons.person),
              ),
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 20),
            const TextField(
              textAlign: TextAlign.left,
              obscureText: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusColor: Colors.amber,
                hoverColor: Colors.deepOrangeAccent,
                labelText: 'Contraseña',
                prefixIcon: Icon(Icons.key),
              ),
              style: TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: onSwitchToHome,
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
}
