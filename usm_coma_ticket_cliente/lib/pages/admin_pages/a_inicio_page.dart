import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:usm_coma_ticket_cliente/constants.dart';
import 'package:usm_coma_ticket_cliente/pages/admin_pages/a_eventos.dart';

import '../../providers/eventos_provider.dart';
import '../../services/firestore_service.dart';
import '../../widgets/noticia_widget.dart';

class AdminInicioPage extends StatefulWidget {
  const AdminInicioPage({super.key});

  @override
  State<AdminInicioPage> createState() => _AdminInicioPageState();
}

class _AdminInicioPageState extends State<AdminInicioPage> {
  final fPrecio =
      NumberFormat.currency(decimalDigits: 0, locale: 'es-CL', symbol: '');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Eventos Próxmos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              IconButton(
                  onPressed: () {
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => AdminEventos(),
                    );
                    Navigator.push(context, route);
                  },
                  icon: Icon(MdiIcons.pencil))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 250,
            child: StreamBuilder(
                stream: FirestoreService().noticias(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData ||
                      snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return CarouselSlider.builder(
                      //[
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index, realIndex) {
                        var noticia = snapshot.data!.docs[index];
                        return NoticiaWidget(
                          image: noticia['image'],
                        );
                      },
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ));
                }),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        FutureBuilder(
          future: EventosProvider().getEventos(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            return Expanded(
              child: ListView.separated(
                itemCount: snapshot.data.length,
                separatorBuilder: (context, index) => Divider(
                  thickness: 1.3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  var evento = snapshot.data[index];
                  var estado;
                  var iconEstado;
                  if (evento['estado'] == 0) {
                    estado = 'Finalizado';
                    iconEstado = MdiIcons.emoticonAngry;
                  } else {
                    estado = 'Vigente';
                    iconEstado = MdiIcons.emoticonExcitedOutline;
                  }
                  return ListTile(
                    leading: Container(
                      width: 80,
                      height: 100,
                      decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(estado),
                          Icon(iconEstado),
                        ],
                      ),
                    ),
                    title: Text(evento['nombre']),
                    subtitle:
                        Text('\$' + fPrecio.format(evento['precio_entrada'])),
                    trailing: Builder(builder: (context) {
                      if (estado == 'Finalizado') {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.grey),
                          onPressed: () {
                            /* 
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Compra de entrada'),
                                  content: Text('Has comprado la entrada'),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('OK'))
                                  ],
                                );
                              },
                            ); */
                          },
                          child: Text('Comprar'),
                        );
                      } else {
                        return ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Compra de entrada'),
                                  content: Text('Has comprado la entrada'),
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('OK'))
                                  ],
                                );
                              },
                            );
                          },
                          child: Text('Comprar'),
                        );
                      }
                    }),
                    onTap: () {},
                  );
                },
              ),
            );
          },
        )
      ],
    );
  }
}
