import 'package:adote_me/Model/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class ConexaoBD{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final facebookLogin = FacebookLogin();

  Map userProfile;

  Future cadastrarUsuario(Usuario usuario) async {

    try {
      await _auth.createUserWithEmailAndPassword(

          email: usuario.email,
          password: usuario.senha

      ).then((firebaseUser) {
        usuario.idUsuario = firebaseUser.user.uid;
        //Salvar dados do usuário
        db.collection("usuarios")
            .doc(usuario.idUsuario)
            .set(usuario.toMap());
        print("aq");

      });
      return true;
    }
    catch (error){

      var errorMessage;

      switch (error.code) {
        case "weak-password":
          errorMessage = "Senha fraca!";
          return errorMessage;

        case "invalid-email":
          errorMessage = "O valor fornecido para a propriedade do usuário email é inválido!";
          return  errorMessage;

        case "email-already-exists":
          errorMessage = "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        case "email-already-in-use":
          errorMessage = "O e-mail fornecido já está em uso por outro usuário. ";
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
      await _auth.signInWithEmailAndPassword(
          email: usuario.email,
          password: usuario.senha
      );
      return true;
    }
    catch(error){

      var errorMessage;
      print(error.code);

      switch (error.code) {
        case "invalid-email":
          errorMessage = "O valor fornecido para a propriedade do usuário email é inválido!";
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
          errorMessage = "O e-mail fornecido já está em uso por outro usuário. ";
          return errorMessage;

        default:
          errorMessage = "Um erro desconhecido ocorreu.";
          return errorMessage;
      }
    }

  }
//******************************************************************************
  Future<bool> loginWithGoogle() async {

    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    final UserCredential authResult = await _auth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {

      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = _auth.currentUser;
      assert(user.uid == currentUser.uid);

      DocumentSnapshot documentSnapshot = await db.collection("usuarios").doc(user.uid).get();

      if (documentSnapshot.exists == false){
        Usuario usuario = Usuario();
        usuario.email = user.email;
        usuario.nome  = user.displayName;
        usuario.idUsuario = user.uid;

        try{
          db.collection("usuarios")
              .doc(user.uid)
              .set(usuario.toMap());
          return true;
        }
        catch (e) {
          deslogarUsuario();
          return false;
        }
      }
      return true;
    }
    return false;
  }
//******************************************************************************
   Future loginWithFacebook() async{

    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;

        AuthCredential credential = FacebookAuthProvider.credential(token);
        var reponse = await _auth.signInWithCredential(credential);

        DocumentSnapshot documentSnapshot = await db.collection("usuarios")
            .doc(reponse.user.uid).get();

        if (documentSnapshot.exists == false){
          Usuario usuario = Usuario();
          usuario.email = reponse.user.email;
          usuario.nome  = reponse.user.displayName;
          usuario.idUsuario = reponse.user.uid;

          try{
            db.collection("usuarios")
                .doc(reponse.user.uid)
                .set(usuario.toMap());
            return true;
          }
          catch (e) {
            deslogarUsuario();
            return false;
          }
        }
        return true;
        break;

      case FacebookLoginStatus.cancelledByUser:
        return false;
        break;
      case FacebookLoginStatus.error:
        return false;
        break;
    }

  }
//******************************************************************************

  Future<bool> deslogarUsuario() async {

     _auth.signOut();

     facebookLogin.logOut();

     await _googleSignIn.signOut();

     bool verificarUsuarioDeslogado =  checkCurrentUser();
     if(verificarUsuarioDeslogado){
       return false;
     }
     else{
       return true;
     }
  }
//******************************************************************************

  Future alterarEmail(Usuario usuario) async {
    final user = FirebaseAuth.instance.currentUser;

    bool updateEmail = await user.updateEmail(usuario.email)
          .then((firebase){
          return true;
        }).catchError((error){
          return false;
        });

    return updateEmail;
  }
//******************************************************************************

  Future exluirUsuario() async {
    FirebaseFirestore userDB = FirebaseFirestore.instance;
    final user = FirebaseAuth.instance.currentUser;
    bool deleteDB;
    bool exclusao;

    try{
      userDB.collection("usuarios").doc(user.uid).delete();
      deleteDB = true;
    }
    catch(error){
      deleteDB = false;
    }

    if(deleteDB){
      exclusao = await user.delete()
          .then((firebaseUser){
            return true;

      })
          .catchError((error){
            return false;
      });
    }else{
      exclusao = false;
    }

    return exclusao;
  }

//******************************************************************************

  Future<void> esqueciSenha(Usuario usuario) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: usuario.email);
  }

//******************************************************************************

  bool checkCurrentUser(){
    User user =  _auth.currentUser;
    return user != null ? true : false;
  }

//******************************************************************************
  Future recuperarDadosUsuario() async {
    User user =  _auth.currentUser;
    Usuario usuario = Usuario();

    DocumentSnapshot snapshot      = await db.collection("usuarios")
                                          .doc(user.uid)
                                          .get();

    DocumentSnapshot snapshotAdmin = await db.collection("admins")
                                          .doc(user.uid)
                                          .get();

    Map<String, dynamic> dados = snapshot.data();
    usuario.nome       = dados['nome'];
    usuario.email      = dados['email'];
    usuario.idUsuario  = dados['id'];

    if(snapshotAdmin.exists) {
      usuario.admin = true;
    }
    else{
      usuario.admin = false;

    }

    return usuario;
  }
//******************************************************************************


}

