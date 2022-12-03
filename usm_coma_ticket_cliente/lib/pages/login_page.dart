import 'package:flutter/material.dart';
import 'package:usm_coma_ticket_cliente/constants.dart';

import '../widgets/campo_login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kCampoLoginColor,
      body: Container(
        margin: EdgeInsets.all(12),
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 70.0, bottom: 60),
                child: Center(
                  child: Image.asset(
                    'assets/cropped_logo_coma_ticket.png',
                    //'assets/cropped_coma_ticket_variant.png',
                    height: 140,
                    color: kTextLoginColor,
                  ),
                ),
              ),
              CampoLoginWidget(
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              CampoLoginWidget(
                hintText: 'Contraseña',
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
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
                  onPressed: () {},
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
