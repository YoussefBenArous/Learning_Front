import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_learning/controllers/Profile_Controller.dart';
import 'package:flutter_application_learning/models/cour/cours_screen.dart';
import 'package:flutter_application_learning/screens/home/update_screen.dart';
import 'package:get/get.dart';
import '../storage/app_storage.dart';

class CustomDrawer extends GetView<ProfileController> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blueAccent,
      width: MediaQuery.of(context).size.width * .4,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            currentAccountPicture: Image.asset(
              'assets/image/login.png',
            ),
            currentAccountPictureSize: const Size(80, 80),
            accountName: Text(
              AppStorage.readName() ?? 'name',
              style: const TextStyle(color: Colors.black),
            ),
            accountEmail: Text(AppStorage.readEmail() ?? "email",
                style: const TextStyle(color: Colors.black)),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.home),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () {
              Navigator.pop(context);
            },
            leading: const Icon(Icons.person),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          ListTile(
            title: const Text('Cours'),
            onTap: () {
              Get.to(const CoursScreen());
            },
            leading: const Icon(Icons.book),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Get.to(UpdateScreen());
            },
            leading: const Icon(Icons.settings),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          ListTile(
            title: const Text('Logout'),
            onTap: () {
              _showLogoutDialog(context);
            },
            leading: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  Future<void> _showLogoutDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Utilisateur doit sélectionner une option
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Disconnect'),
          content: const Text('Are you sure you want to log out ?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme le dialogue
              },
            ),
            TextButton(
              child: const Text('Disconnect'),
              onPressed: () {
                controller.logout();
                // Ajoutez ici la logique de déconnexion, comme la navigation ou le nettoyage des données
                
                // Exemple de logique de déconnexion (à adapter selon vos besoins)
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Disconnection completed ! ')),
                );
              },
            ),
          ],
        );
      },
    );
  }
}