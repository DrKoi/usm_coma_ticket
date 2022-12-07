import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseServices {
  //CREACION DE VARIABLES
  final _auth = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn();

  //INICIAR SESION CON GOOGLE
  signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential authCredential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken);
        await _auth.signInWithCredential(authCredential);
      }

      //ERROR AL INICIAR SESION
    } on FirebaseAuthException catch (ex) {
      print(ex.message);
      throw ex;
    }
  }

  //CERRAR SESION
  signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
  }
}
