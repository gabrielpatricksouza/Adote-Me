import 'package:adote_me/Model/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConexaoBD{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore db = FirebaseFirestore.instance;
  CollectionReference ref;


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
        case "ERROR_WEAK_PASSWORD":
          errorMessage = "Senha fraca!";
          return errorMessage;
        case "ERROR_INVALID_EMAIL":
          errorMessage = "O e-mail informado não parece ser um e-mail!";
          return  errorMessage;
        case "ERROR_EMAIL_ALREADY_IN_USE":
          errorMessage = "O email já está sendo usado por outro usuário.";
          return errorMessage;
        default:
          errorMessage = "Um erro desconhecido ocorreu.$error";
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
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "O e-mail informado não parece ser um e-mail!";
          return errorMessage;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Senha errada!";
          return errorMessage;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "O usuário não existe.";
          return errorMessage;
        case "ERROR_USER_DISABLED":
          errorMessage = "Esse usuário foi desabilitado.";
          return errorMessage;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Muitas requisições. Tente mais tarde.";
          return errorMessage;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Login com email e senha não está habilitado.";
          return errorMessage;
        default:
          errorMessage = "Um erro desconhecido ocorreu.";
          return errorMessage;
      }
    }

  }
//******************************************************************************

  bool deslogarUsuario(){
     _auth.signOut();
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

