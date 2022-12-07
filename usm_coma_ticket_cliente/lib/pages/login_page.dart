import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:usm_coma_ticket_cliente/constants.dart';
import 'package:usm_coma_ticket_cliente/pages/main_page.dart';

import '../services/auth_service.dart';
import '../widgets/campo_login_widget.dart';
import 'admin_pages/a_home_page.dart';
import 'client_pages/c_home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();

  late final FocusNode _passFocusNode;

  final _formKey = GlobalKey<FormState>();
  String error = '';
  @override
  void initState() {
    _passFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    /* emailCtrl.dispose();
    passCtrl.dispose(); */
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCampoLoginColor,
      body: SafeArea(
        /* margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(10), */
        child: Form(
          key: _formKey,
          child: ListView(
            physics: ClampingScrollPhysics(),
            /* mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start, */
            padding: EdgeInsets.all(15),
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 50),
                child: Image(
                  height: 140,
                  color: kTextLoginColor,
                  image: AssetImage(
                    'assets/cropped_logo_coma_ticket.png',
                    //'assets/cropped_coma_ticket_variant.png',
                  ),
                ),
              )),
              CampoLoginWidget(
                hintText: 'Email',
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: () =>
                    FocusScope.of(context).requestFocus(_passFocusNode),
              ),
              SizedBox(
                height: 20,
              ),
              CampoLoginWidget(
                  hintText: 'Contraseña',
                  controller: passCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  focusNode: _passFocusNode,
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: () {
                    FocusScope.of(context).unfocus;
                  }),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        color: kTextLoginColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    /* MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => HomePage(),
                    );
                    Navigator.push(context, route); */
                    login();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: kPrimaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 3.5,
                      vertical: 18,
                    ),
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: kFondoLoginColor),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 40.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: kTextLoginColor,
                      ),
                    ),
                    Text(
                      '  ó  ',
                      style: TextStyle(
                        color: kTextLoginColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: kTextLoginColor,
                      ),
                    ),
                  ],
                ),
              ),
              //BOTON DE INICIO DE SESION CON GOOGLE
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: OutlinedButton.icon(
                      icon: Image.asset(
                        'assets/google.png',
                        height: 45,
                        width: 45,
                      ),
                      label: Text('Iniciar sesión con Google',
                          style: TextStyle(fontSize: 20, color: Colors.white)),
                      onPressed: () async {
                        //UserCredential userCredential =
                        await FirebaseServices().signInWithGoogle();
                        /* SharedPreferences sp =
                            await SharedPreferences.getInstance();
                        sp.setString(
                            'userEmail', userCredential.user!.email.toString()); */
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ClienteHomePage()));
                      },
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿No tienes una cuenta?',
                      style: TextStyle(
                        color: kTextLoginColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('Regístrate aquí',
                          style: TextStyle(
                            color: kAccentColor,
                            fontWeight: FontWeight.w800,
                            fontSize: 18,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailCtrl.text.trim(),
        password: passCtrl.text.trim(),
      );

      SharedPreferences sp = await SharedPreferences.getInstance();
      sp.setString('userEmail', userCredential.user!.email.toString());

      MaterialPageRoute route = MaterialPageRoute(
        builder: (context) => MainPage(),
      );
      Navigator.pushReplacement(context, route);
    } on FirebaseAuthException catch (ex) {
      switch (ex.code) {
        case 'user-not-found':
          error = 'Usuario no existe';
          break;
        case 'wrong-password':
          error = 'Contraseña incorrecta';
          break;
        case 'user-disabled':
          error = 'Cuenta desactivada';
          break;
        default:
          error = ex.message.toString();
          break;
      }
      setState(() {});
    }
  }
}
