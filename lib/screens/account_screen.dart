import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paramètres'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                foregroundImage: AssetImage('assets/images/hugues-codeur.png'),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hugues Codeur',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'huguescodeur@gmail.com',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: const Text('Adresse e-mail'),
            subtitle: const Text('huguescodeur@gmail.com'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: const Text('Numéro de téléphone'),
            subtitle: const Text('+2250503020385'),
            onTap: () {},
          ),
          ListTile(
            leading: Image.asset(
              "assets/icons/eclair-white-bold.png",
              height: 25,
            ),
            title: const Text('Passer à Bot Plus'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('Personnaliser'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('À propos de'),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
            title: const Text(
              'Se déconnecter',
              style: TextStyle(color: Colors.red),
            ),
            onTap: () {
              // Déconnexion logique
            },
          ),
        ],
      ),
    );
  }
}
