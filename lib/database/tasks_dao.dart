import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/database/model/task_model.dart';
import 'package:todo_app/database/users_dao.dart';

class TaskDao {
  static CollectionReference<Task> getTaskCollection(String uid) {
    // Ana hena hatet el document (row) bta3t collection el tasks fe el document (row) bta3 collection el Users 3shan yb'a kol user 3ando akter mn document 3ady.
    return UserDao.getUsersCollection()
        .doc(uid)
        .collection(Task.collectionName)
        .withConverter(
          fromFirestore: (snapshot, options) =>
              Task.fromFireStore(snapshot.data()),
          toFirestore: (value, options) => value.toFireStore(),
        );
  }

  static Future<void> createTask(Task task, String uid) {
    var taskCollection = getTaskCollection(uid).doc();
    task.id = taskCollection.id;
    return taskCollection.set(task);
  }
}
