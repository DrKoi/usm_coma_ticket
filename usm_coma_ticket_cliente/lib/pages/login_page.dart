import 'package:flutter/material.dart';
import 'package:usm_coma_ticket_cliente/constants.dart';

import '../widgets/campo_login_widget.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _pass = '';

  late final FocusNode _passFocusNode;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
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
                    MaterialPageRoute route = MaterialPageRoute(
                      builder: (context) => HomePage(),
                    );
                    Navigator.push(context, route);
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(
                    'assets/google.png',
                    height: 45,
                    width: 45,
                  ),
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
}
