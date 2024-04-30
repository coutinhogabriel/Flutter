import 'package:exemplo_json/Controller/ProdutosController.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //atributos
  ProdutoController _produtoController = ProdutoController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _produtoController.loadProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Produtos'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _produtoController.produtos.length,
              itemBuilder: (context, index) {
                final produto = _produtoController.produtos[index];
                return ListTile(
                  title: Text(produto.nome),
                  subtitle: Text(
                      'Preço: ${produto.preco.toStringAsFixed(2)} - Categoria: ${produto.categoria}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
