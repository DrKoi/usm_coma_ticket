import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:usm_coma_ticket_cliente/widgets/header_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../services/firestore_service.dart';
import '../../widgets/noticia_widget.dart';
import '../login_page.dart';

class ClienteHomePage extends StatefulWidget {
  const ClienteHomePage({super.key});

  @override
  State<ClienteHomePage> createState() => _ClienteHomePageState();
}

class _ClienteHomePageState extends State<ClienteHomePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  /* List<String>docsID=[];

  Future getDocsId() async {
    await FirebaseFirestore.instance.collection('noticias').get().then((snapshot)=>snapshot.docs.forEach((document){
      print(document);
      docsID.add(document.reference.id);
    }));
  } */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Inicio'),
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
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.favorite_border),
                  title: Text("Favoritos"),
                  /* onTap: () {
                        Get.to(Saved(),transition: Transition.rightToLeft,duration: Duration(seconds: 1));
                      }, */
                ),
                ListTile(
                  leading: Icon(Icons.shopping_cart_outlined),
                  title: Text("Carrito"),
                  /* onTap: () {
                        Get.to(NCartPage(),transition: Transition.rightToLeft,duration: Duration(seconds: 1));
                      }, */
                ),
                /* ListTile(
                  leading: Icon(Icons.shopping_bag_outlined),
                  title: Text("Orders"),
                  /* onTap: () {
                        Get.to(OrderPage(),transition: Transition.rightToLeft,duration: Duration(seconds: 1));
                      }, */
                ), */
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                'Eventos Próximos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                            autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                            viewportFraction: 0.8,
                          ));
                    }),
              ),
            ),
            //TabBar(tabs: [Tab()])
            //ListView.builder(),
          ],
        ),
      ),
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
