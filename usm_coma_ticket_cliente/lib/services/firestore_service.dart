import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> noticias() {
    return FirebaseFirestore.instance.collection('noticias').snapshots();
  }

  //agregar
  /* Future agregar(String codProducto, String nombre, int stock) {
    return FirebaseFirestore.instance.collection('productos').doc().set({
      'cod_producto': codProducto,
      'nombre': nombre,
      'stock': stock,
    });
  }

  //borrar
  Future borrar(String productoId) {
    return FirebaseFirestore.instance.collection('productos').doc(productoId).delete();
  } */
}
