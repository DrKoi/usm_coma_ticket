import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:usm_coma_ticket_cliente/pages/client_pages/c_inicio_page.dart';
import 'package:usm_coma_ticket_cliente/pages/client_pages/entrada_page.dart';
import 'package:usm_coma_ticket_cliente/providers/eventos_provider.dart';
import 'package:usm_coma_ticket_cliente/widgets/header_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_coma_ticket_cliente/widgets/screen_display.dart';

import '../../services/firestore_service.dart';
import '../../widgets/noticia_widget.dart';
import '../login_page.dart';
import 'a_inicio_page.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final paginas = [
    AdminInicioPage(),
    EntradasPage(),
  ];
  int paginalSel = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Admin Eventos Coma Ticket'),
        actions: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://imgs.search.brave.com/3h7NI7f7kjq3y3LPpwOvk4ujLfaZIA2dFstQ6fIW_SU/rs:fit:800:800:1/g:ce/aHR0cHM6Ly9zcC1p/bWFnZXMuc3VtbWl0/cG9zdC5vcmcvOTQ3/MDA2LmpwZz9hdXRv/PWZvcm1hdCZmaXQ9/bWF4Jmg9ODAwJml4/bGliPXBocC0yLjEu/MSZxPTM1JnM9ODc2/Njk2NzAwODAwODE2/ZDAxZTBkMWViMzFj/ZTdhYjA'),

                /* NetworkImage(
                    FirebaseAuth.instance.currentUser!.photoURL.toString()) */
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 20,
          ),
          FutureBuilder(
            future: this.getUserEmail(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData ||
                  snapshot.connectionState == ConnectionState.waiting) {
                return Text('Cargando...');
              }

              return HeaderDelDrawer(
                  //backgroudImage: 'assets/user.jpg',
                  backgroudImage:
                      'https://imgs.search.brave.com/3h7NI7f7kjq3y3LPpwOvk4ujLfaZIA2dFstQ6fIW_SU/rs:fit:800:800:1/g:ce/aHR0cHM6Ly9zcC1p/bWFnZXMuc3VtbWl0/cG9zdC5vcmcvOTQ3/MDA2LmpwZz9hdXRv/PWZvcm1hdCZmaXQ9/bWF4Jmg9ODAwJml4/bGliPXBocC0yLjEu/MSZxPTM1JnM9ODc2/Njk2NzAwODAwODE2/ZDAxZTBkMWViMzFj/ZTdhYjA',
                  nombreUsuario: 'Usuario',
                  email: snapshot.data);
            },
          ),
          Container(
            padding: EdgeInsets.all(15),
            child: Wrap(
              runSpacing: 0,
              children: [
                ListTile(
                  leading: Icon(Icons.home_outlined),
                  title: Text("Inicio"),
                  onTap: () {
                    setState(() {
                      paginalSel = 0;
                    });
                  },
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart_outlined),
                  title: Text("Entradas Compradas"),
                  onTap: () {
                    setState(() {
                      paginalSel = 1;
                    });
                  },
                ),
                Divider(
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.person_outline_outlined),
                  title: Text("Perfil"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.settings_outlined),
                  title: Text("Configuración"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.logout_outlined),
                  title: Text("Cerrar Sesión"),
                  onTap: () {
                    logout(context);
                  },
                )
              ],
            ),
          ),
        ])),
      ),
      body: paginas[paginalSel],
    );
  }

  Future<String> getUserEmail() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('userEmail') ?? 'email del usuario';
  }

  void logout(BuildContext context) async {
    //cerrar sesion en firebase
    await FirebaseAuth.instance.signOut();

    //borrar user email de shared preferences
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('userEmail');

    //redirigir al login
    MaterialPageRoute route =
        MaterialPageRoute(builder: ((context) => LoginPage()));
    Navigator.pushReplacement(context, route);
  }
}
