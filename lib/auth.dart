import 'package:data/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user object based on firebase user
  MyUser _userFromFirebaseUser(User user) {
   return user != null? MyUser(uid: user.uid):null;
  }

  //auth change user stream
  Stream<MyUser> get user {
    return _auth.authStateChanges()
        //.map((User user) => _userFromFirebaseUser(user)); this also can be used
    .map(_userFromFirebaseUser);
  }

  //anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e);
      return null;
    }
  }


  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    }
    catch(e) {
      print(e.toString());
      return null;
    }
  }


  //Register with email and pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


//Sign in with email and pass
  Future signInWithEmailPass(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }

  }



}
