import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                image: NetworkImage(
                  "https://picsum.photos/200/300",
                ),
                fit: BoxFit.fill,
              ),
            ),
            child: Text('Steganography'),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/',
                (Route<dynamic> route) => false,
              );
            },
          ),
          ListTile(
            title: const Text('Encrypt'),
            onTap: () {
              Navigator.pushNamed(context, '/encrypt');
            },
          ),
          ListTile(
            title: const Text('Decrypt'),
            onTap: () {
              Navigator.pushNamed(context, '/decrypt');
            },
          ),
          ListTile(
            title: const Text('About Us'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}
