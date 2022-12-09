import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:usm_coma_ticket_cliente/services/auth_service.dart';

import '../../services/firestore_service.dart';
import 'agregar_evento_page.dart';

class AdminEventos extends StatefulWidget {
  const AdminEventos({super.key});

  @override
  State<AdminEventos> createState() => _AdminEventosState();
}

class _AdminEventosState extends State<AdminEventos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Eventos Publicados')),
      body: Column(
        children: [
          StreamBuilder(
              stream: FirestoreService().noticias(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData ||
                    snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) => Divider(
                      thickness: 1.3,
                    ),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var noticia = snapshot.data!.docs[index];
                      return ListTile(
                        leading: Image.network(noticia['image']),
                        title: Text(noticia['titulo']),
                      );
                    },
                  ),
                );
              }),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            height: 100,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber.shade100),
            child: MaterialButton(
              onPressed: () {
                MaterialPageRoute route = MaterialPageRoute(
                  builder: (context) => AgregarEvento(),
                );
                Navigator.push(context, route).then((value) {
                  setState(() {});
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Publicar noticia'), Icon(MdiIcons.plus)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
