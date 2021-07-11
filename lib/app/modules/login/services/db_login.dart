import 'package:adote_me/app/Model/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConexaoBD {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;


  Future cadastrarUsuario(Usuario usuario) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
          email: usuario.email, password: usuario.senha)
          .then((firebaseUser) {
        usuario.idUsuario = firebaseUser.user!.uid;
        db.collection("usuarios").doc(usuario.idUsuario).set(usuario.toMap());
      });
      return true;
    } catch (error) {
      var errorMessage;

      switch (error) {
        case "weak-password":
          errorMessage = "Senha fraca!";
          return errorMessage;

        case "invalid-email":
          errorMessage =
          "O valor fornecido para a propriedade do usuário email é inválido!";
          return errorMessage;

        case "email-already-exists":
          errorMessage =
          "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        case "email-already-in-use":
          errorMessage =
          "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu.";
          return errorMessage;
      }
    }
  }
//******************************************************************************

  Future logarUsuario(Usuario usuario) async {

    try {
      await _auth.signInWithEmailAndPassword(email: usuario.email, password: usuario.senha);
      return true;

    } on FirebaseAuthException catch (error) {
      var errorMessage;

      switch (error.code) {
        case "invalid-email":
          errorMessage =
          "O valor fornecido para a propriedade do usuário email é inválido!";
          return errorMessage;

        case "wrong-password":
          errorMessage = "Senha errada!";
          return errorMessage;

        case "user-not-found":
          errorMessage = "O usuário não existe.";

          return errorMessage;
        case "user-disable":
          errorMessage = "Esse usuário foi desabilitado.";
          return errorMessage;

        case "too-many-requests":
          errorMessage = "Muitas requisições. Tente mais tarde.";
          return errorMessage;

        case "operation-not-allowed":
          errorMessage = "Login com email e senha não está habilitado.";
          return errorMessage;

        case "email-already-in-use":
          errorMessage =
          "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu. $error";
          return errorMessage;
      }
    }
  }

//******************************************************************************


  Future<bool> deslogarUsuario() async {

    await  _auth.signOut();

    bool verificarUsuarioDeslogado = checkCurrentUser();
    if (verificarUsuarioDeslogado) {
      return false;
    } else {
      return true;
    }
  }
//******************************************************************************
//   Future alterarEmail(UsuarioFirebase usuario) async {
//     final user = FirebaseAuth.instance.currentUser;
//
//     bool updateEmail = await user.updateEmail(usuario.email).then((firebase) {
//       return true;
//     }).catchError((error) {
//       return false;
//     });
//
//     return updateEmail;
//   }
//******************************************************************************
//
//   Future exluirUsuario() async {
//     FirebaseFirestore userDB = FirebaseFirestore.instance;
//     final user = FirebaseAuth.instance.currentUser;
//     bool deleteDB;
//     bool exclusao;
//
//     try {
//       userDB.collection("usuarios").doc(user.uid).delete();
//       deleteDB = true;
//     } catch (error) {
//       deleteDB = false;
//     }
//
//     if (deleteDB) {
//       exclusao = await user.delete().then((firebaseUser) {
//         return true;
//       }).catchError((error) {
//         return false;
//       });
//     } else {
//       exclusao = false;
//     }
//     return exclusao;
//   }

//******************************************************************************

  Future esqueciSenha(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

//******************************************************************************

  bool checkCurrentUser() {
    User? user = _auth.currentUser;
    return user != null ? true : false;
  }

// //******************************************************************************
//   Future recuperarDadosUsuario() async {
//     User? user = _auth.currentUser;
//     UsuarioFirebase usuario = UsuarioFirebase();
//
//     DocumentSnapshot snapshot =
//     await db.collection("usuarios").doc(user.uid).get();
//
//     DocumentSnapshot snapshotAdmin =
//     await db.collection("empresas").doc(user.uid).get();
//
//     Object dados = snapshot.data();
//     usuario.nome = dados['nome'];
//     usuario.email = dados['email'];
//     usuario.idUsuario = dados['id'];
//
//     if (snapshotAdmin.exists) {
//       usuario.admin = true;
//     } else {
//       usuario.admin = false;
//     }
//
//     return usuario;
//   }

}
