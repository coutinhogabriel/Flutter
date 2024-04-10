import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Configurações de Conta',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Editar Perfil'),
              onTap: () {
                // Navigate to profile edit page
              },
            ),
            ListTile(
              title: Text('Alterar Senha'),
              onTap: () {
                // Navigate to change password page
              },
            ),
            Divider(),
            Text(
              'Configurações de Aplicativo',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              title: Text('Notificações'),
              onTap: () {
                // Navigate to notifications settings page
              },
            ),
          ],
        ),
      ),
    );
  }
}
