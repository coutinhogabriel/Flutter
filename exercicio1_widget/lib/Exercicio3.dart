import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Criando uma lista de itens com informações variadas
  final List<Map<String, dynamic>> items = [
    {'title': 'Item 1', 'subtitle': 'Descrição do Item 1', 'icon': Icons.shopping_cart},
    {'title': 'Item 2', 'subtitle': 'Descrição do Item 2', 'icon': Icons.favorite},
    {'title': 'Item 3', 'subtitle': 'Descrição do Item 3', 'icon': Icons.location_on},
    {'title': 'Item 4', 'subtitle': 'Descrição do Item 4', 'icon': Icons.music_note},
    {'title': 'Item 5', 'subtitle': 'Descrição do Item 5', 'icon': Icons.movie},
    {'title': 'Item 6', 'subtitle': 'Descrição do Item 6', 'icon': Icons.restaurant},
    {'title': 'Item 7', 'subtitle': 'Descrição do Item 7', 'icon': Icons.book},
    {'title': 'Item 8', 'subtitle': 'Descrição do Item 8', 'icon': Icons.phone},
    {'title': 'Item 9', 'subtitle': 'Descrição do Item 9', 'icon': Icons.directions_bike},
    {'title': 'Item 10', 'subtitle': 'Descrição do Item 10', 'icon': Icons.beach_access},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exercicio 3"),
        ),
        body: ListView(
          children: [
            // Adicionando os itens à lista usando um loop for
            for (var item in items)
              Card(
                child: ListTile(
                  title: Text(item['title']), // Título do item
                  subtitle: Text(item['subtitle']), // Subtítulo do item
                  leading: Icon(item['icon']), // Ícone à esquerda do item
                ),
              ),
          ],
        ),
      ),
    );
  }
}
