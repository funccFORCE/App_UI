import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data/member.dart';
import 'package:data/user.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference memberCollection = FirebaseFirestore.instance.collection('members');

  Future updateUserData(String name, String course, String mob, String college, String department) async {
    return await memberCollection.doc(uid).set({
      'name': name,
      'course': course,
      'mob' : mob,
      'college': college,
      'department': department,
    });
  }

  //member list from snapshot
  List<Member> _memberListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((docu){
      return Member(
        name: docu.data()['name'] ?? '',
        course: docu.data()['course'] ?? '',
        mob: docu.data()['mob'] ?? '',
        college: docu.data()['college'] ?? '',
        department: docu.data()['department'] ?? '',
      );
    }).toList();
  }

  //userData from snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data()['name'],
      course: snapshot.data()['course'],
      mob: snapshot.data()['mob'],
      college: snapshot.data()['college'],
      department: snapshot.data()['department'],
    );
  }

  //get members stream
  Stream<List<Member>> get members {
    return memberCollection.snapshots()
        .map(_memberListFromSnapshot);
}

  //get user documents stream from firebase
  Stream<UserData> get userData {
    return memberCollection.doc(uid).snapshots()
        .map(_userDataFromSnapshot);
  }

}