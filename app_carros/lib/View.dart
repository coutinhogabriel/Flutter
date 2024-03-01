import 'package:app_carros/Controller.dart';
import 'package:app_carros/Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelaListaCarros extends StatelessWidget {
  TelaListaCarros(CarroController controllerCarros);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Barra superior do aplicativo
      appBar: AppBar(
        title: Text('Meus carros'),
      ),
      // Corpo principal do aplicativo
      body: Column(
        children: [
          // Lista de tarefas usando um Consumer do Provider para atualização automática
          Expanded(
            child: Consumer<CarroController>(
              builder: (context, model, child) {
                return ListView.builder(
                  itemCount: model.listarCarros.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // Exibição os Carros listados no controller
                      title: Text(model.listarCarros[index].modelo),
                      // Quando clicado o carro, vou entrar na telaDescricaoCarro
                      onTap: () {
                        var push = Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  TelaDetalheCarros(model.listarCarros[index]),
                            ));
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

TelaDetalheCarros(Carro listarCarro) {
}

class TelaDetalheCarro extends StatelessWidget {
  final Carro carro;
  TelaDetalheCarro(this.carro);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes do Carro"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(carro.imagemUrl),
            SizedBox(height: 20),
            Text("Modelo: ${carro.modelo}"),
            Text("Ano: ${carro.ano}"),
          ],
        ),
      ),
    );
  }
}
