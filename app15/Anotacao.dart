import 'AnotacaoHelper.dart';
 
class Anotacao {
  int id;
  String titulo;
  String data;
 
  Anotacao(this.titulo, this.data);
 
  Anotacao.fromMap(Map map) {
    this.id = map["id"];
    this.titulo = map["titulo"];
    this.data = map["data"];
  }
 
  Map toMap() {
    Map<String, dynamic> map = {
      "titulo": this.titulo,
      "data": this.data,
    };
 
    if (this.id != null) {
      map["id"] = this.id;
    }
 
    return map;
  }
}
 