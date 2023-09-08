import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ServScreen extends StatelessWidget {
  const ServScreen({
    super.key,
    required this.onSwitchToHome,
    required this.onSwitchToStart,
  });

  final void Function() onSwitchToStart;
  final void Function() onSwitchToHome;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EnlaceBooking'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(
                Icons.menu_rounded,
                size: 40,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.zero,
                border: Border(bottom: BorderSide.none),
                color: Colors.blueAccent,
              ),
              child: Text(
                'Menu Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.pop(context); // Close the Drawer
              },
            ),
            ListTile(
              title: const Text('Log out'),
              subtitle:
                  const Text('Regresarás al la pantalla de inicio de sesión'),
              isThreeLine: true,
              titleTextStyle: const TextStyle(color: Colors.blue),
              onTap: onSwitchToStart,
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Servicios',
          style: GoogleFonts.quicksand(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: onSwitchToHome,
            icon: const Icon(Icons.home),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.access_alarms_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.airplanemode_on),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.art_track),
          ),
        ]),
      ),
    );
  }
}
