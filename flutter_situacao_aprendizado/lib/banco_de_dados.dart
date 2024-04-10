import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Usuario {
  final int id;
  final String email;
  final String senha;

  Usuario({required this.id, required this.email, required this.senha});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'senha': senha,
    };
  }
}

class BancoDeDados {
  static Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'usuarios.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE usuarios(id INTEGER PRIMARY KEY, email TEXT, senha TEXT)",
        );
      },
      version: 1,
    );
  }

  static Future<void> inserirUsuario(Usuario usuario) async {
    final db = await BancoDeDados.getDatabase();
    await db.insert(
      'usuarios',
      usuario.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Usuario>> getUsuarios() async {
    final db = await BancoDeDados.getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('usuarios');

    return List.generate(maps.length, (i) {
      return Usuario(
        id: maps[i]['id'],
        email: maps[i]['email'],
        senha: maps[i]['senha'],
      );
    });
  }
}
