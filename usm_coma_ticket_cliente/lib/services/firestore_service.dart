import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  //obtener los productos
  Stream<QuerySnapshot> noticias() {
    return FirebaseFirestore.instance.collection('noticias').snapshots();
  }

  //agregar
  Future agregar(String titulo, String descripcion, String image) {
    return FirebaseFirestore.instance.collection('noticias').doc().set({
      'titulo': titulo,
      'descripcion': descripcion,
      'image': image,
    });
  }

  //borrar
  /* Future borrar(String productoId) {
    return FirebaseFirestore.instance
        .collection('productos')
        .doc(productoId)
        .delete();
  } */
}
