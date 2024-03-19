import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/database/model/user_model.dart';

class UserDao {
  static CollectionReference<User> getUsersCollection() {
    // insert into firestore
    var db = FirebaseFirestore.instance;
    var userCollection = db.collection(User.collectionName).withConverter(
          fromFirestore: (snapshot, options) =>
              User.fromFireStore(snapshot.data()),
          toFirestore: (value, options) => value.toFireStore(),
        );
    return userCollection;
  }

  static Future<void> createUser(User user) {
    var userCollection = getUsersCollection();
    var doc = userCollection.doc(user.id);
    return doc.set(user);
  }

  static Future<User?> getUser(String uid) async {
    var userCollection = getUsersCollection();
    var doc = userCollection.doc(uid);
    var docSnapshot = await doc.get();
    return docSnapshot.data();
  }
}
