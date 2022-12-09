import 'package:flutter/material.dart';
import 'package:usm_coma_ticket_cliente/constants.dart';
import 'package:usm_coma_ticket_cliente/services/firestore_service.dart';

class AgregarEvento extends StatefulWidget {
  const AgregarEvento({super.key});

  @override
  State<AgregarEvento> createState() => _AgregarEventoState();
}

class _AgregarEventoState extends State<AgregarEvento> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _tituloCtrl = TextEditingController();
  TextEditingController _descripcionCtrl = TextEditingController();
  TextEditingController _imageCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Publicar noticia')),
      //backgroundColor: kTextLoginColor,
      body: SafeArea(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(children: [
                  campoTitulo(),
                  SizedBox(
                    height: 20,
                  ),
                  campoDescripcion(),
                  SizedBox(
                    height: 20,
                  ),
                  campoImage(),
                  SizedBox(
                    height: 20,
                  ),
                  botonPublicar()
                ]),
              ))),
    );
  }

  TextFormField campoTitulo() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'No puede quedar vació';
        }
        return null;
      },
      decoration: InputDecoration(
          label: Text('Título'), labelStyle: TextStyle(color: kColor4)),
      controller: _tituloCtrl,
    );
  }

  TextFormField campoDescripcion() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'No puede quedar vació';
        }
        return null;
      },
      decoration: InputDecoration(
          label: Text('Descripcion'), labelStyle: TextStyle(color: kColor4)),
      controller: _descripcionCtrl,
    );
  }

  TextFormField campoImage() {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'No puede quedar vació';
        }
        return null;
      },
      decoration: InputDecoration(
          label: Text('Link imagen'), labelStyle: TextStyle(color: kColor4)),
      controller: _imageCtrl,
    );
  }

  Container botonPublicar() {
    return Container(
      height: 60,
      width: 500,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: ElevatedButton(
        //style: ElevatedButton.styleFrom(shape: ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            FirestoreService().agregar(_tituloCtrl.text.trim(),
                _descripcionCtrl.text.trim(), _imageCtrl.text.trim());
            Navigator.pop(context);
          }
        },
        child: Text('Publicar'),
      ),
    );
  }
}
