import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:profile/models/student.dart';
import 'package:profile/models/user.dart';
import 'package:profile/models/user.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  // collection reference
  final CollectionReference studentCollection =
      Firestore.instance.collection('students');

  Future<void> updateUserData(String name, String alamat, String phone) async {
    return await studentCollection.document(uid).setData({
      'name': name,
      'alamat': alamat,
      'phone': phone,
    });
  }

  //list snapshot
  List<Student> _studentListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Student(
          name: doc.data['name'] ?? '',
          alamat: doc.data['alamat'] ?? '',
          phone: doc.data['phone'] ?? '');
    }).toList();
  }

  //get the studen stream
  Stream<List<Student>> get students {
    return studentCollection.snapshots().map(_studentListFromSnapshot);
  }

  // userdata snapshot
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      alamat: snapshot.data['alamat'],
      phone: snapshot.data['phone'],
    );
  }

  // Get user doc stream
  Stream<UserData> get userData {
    return studentCollection
        .document(uid)
        .snapshots()
        .map(_userDataFromSnapshot);
  }
}
