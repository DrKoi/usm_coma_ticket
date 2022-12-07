import 'dart:collection';
import 'dart:convert';

import 'package:http/http.dart' as http;

class EntradasProvider {
  final apiURL = 'http://10.0.2.2:8000/api';

  Future<List<dynamic>> getCategorias() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/eventos'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<List<dynamic>> getEntradas() async {
    var respuesta = await http.get(Uri.parse(apiURL + '/entradas'));

    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return [];
    }
  }

  Future<LinkedHashMap<String, dynamic>> agregar(String cod_producto,
      String nombre, int precio, int stock, int categoria) async {
    var respuesta = await http.post(
      Uri.parse(apiURL + '/entradas'),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'cod_entrada': cod_producto,
        'cod_evento': nombre,
        'precio': precio,
        'stock': stock,
        'categoria': categoria,
      }),
    );

    return json.decode(respuesta.body);
  }

  Future<bool> borrar(String cod_producto) async {
    var respuesta =
        await http.delete(Uri.parse(apiURL + '/entradas/' + cod_producto));
    return respuesta.statusCode == 200;
  }

  //retorna los datos de 1 producto en particular
  Future<LinkedHashMap<String, dynamic>> getProducto(
      String cod_producto) async {
    var respuesta =
        await http.get(Uri.parse(apiURL + '/entradas/' + cod_producto));
    if (respuesta.statusCode == 200) {
      return json.decode(respuesta.body);
    } else {
      return LinkedHashMap();
    }
  }

  Future<LinkedHashMap<String, dynamic>> editar(String cod_producto_actual,
      String cod_producto_nuevo, String nombre, int precio, int stock) async {
    var respuesta = await http.put(
      Uri.parse(apiURL + '/entradas/' + cod_producto_actual),
      headers: <String, String>{
        'Content-type': 'application/json',
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        'cod_producto': cod_producto_nuevo,
        'nombre': nombre,
        'precio': precio,
        'stock': stock,
      }),
    );

    return json.decode(respuesta.body);
  }
}
