class Todolist {
  //atributos
  final String id;
  final String titulo;
  final String userId;
  final DateTime timestamp;

  Todolist({required this.id, required this.titulo, required this.userId, required this.timestamp});

  // toMap
  Map<String, dynamic> toMap() {
    return {
      'titulo': titulo,
      'userid': userId,
      'timestamp': timestamp.toString()
    };
  }
  // fromMap
  factory Todolist.fromMap(Map<String, dynamic> map,String id) {
    return Todolist(
      id: id,
      titulo: map['titulo'],
      userId: map['userid'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}