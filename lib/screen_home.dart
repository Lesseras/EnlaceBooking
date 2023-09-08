import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key,
      required this.onSwitchToStart,
      required this.onSwitchToServices});

  final void Function() onSwitchToStart;
  final void Function() onSwitchToServices;

  get onServSwitchScreen => key;

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
                color: Color.fromARGB(255, 57, 114, 161),
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
              titleTextStyle:
                  const TextStyle(color: Color.fromARGB(255, 57, 114, 161)),
              onTap: onSwitchToStart,
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          'Home',
          style: GoogleFonts.quicksand(),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 57, 114, 161),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.access_alarms_rounded,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: onSwitchToStart,
            icon: const Icon(
              Icons.airplanemode_on,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: onSwitchToServices,
            icon: const Icon(
              Icons.art_track,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
