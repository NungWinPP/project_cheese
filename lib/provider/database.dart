import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:csc234_project_cheese/main.dart';
import 'package:csc234_project_cheese/models/cheese.dart';

class DatabaseService {
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference eventCollection =
      FirebaseFirestore.instance.collection('cheese');

  // Future addCheese(String ) async {
  //   return await eventCollection
  //       .doc(uid)
  //       .collection('myevent')
  //       .doc(id)
  //       .set({
  //         'id': id,
  //         'actName': actName,
  //         'startTime': startTime,
  //         'endTime': endTime,
  //         'cat': cat,
  //         'isTimeTable': isTimeTable,
  //       })
  //       .then((e) => {
  //             print('Document Added $startTime'),
  //             print(startTime),
  //           })
  //       .catchError((e) => {
  //             print('Error adding document: ' + e),
  //           });
  // }

  // Future setSemesterPeriod(DateTime startSemester, DateTime endSemester) async {
  //   return await eventCollection
  //       .doc(uid)
  //       .collection('mysemester')
  //       .doc('period')
  //       .set({
  //         'startSemester': startSemester,
  //         'endSemester': endSemester,
  //       })
  //       .then((e) => {
  //             print('Start/end semester is set: $startSemester'
  //                 'and $startSemester'),
  //           })
  //       .catchError((e) => {
  //             print('Error adding document: ' + e),
  //           });
  // }

  // Future addSubject(String id, String subject, DateTime startTime,
  //     DateTime endTime, String cat) async {
  //   print('add subject has been called');
  //   return await eventCollection
  //       .doc(uid)
  //       .collection('mycheese')
  //       .doc(id)
  //       .set({
  //         'id': id,
  //         'subject': subject,
  //         'startTime': startTime,
  //         'endTime': endTime,
  //         'cat': cat,
  //       })
  //       .then((e) => {
  //             print('Document Added $startTime' '$subject'),
  //             print(startTime),
  //           })
  //       .catchError((e) => {
  //             print('Error adding document: ' + e),
  //           });
  // }

  // Future updateEvent(String id, String actName, DateTime startTime,
  //     DateTime endTime, String cat, bool isTimeTable) async {
  //   return await eventCollection
  //       .doc(uid)
  //       .collection('myevent')
  //       .doc(id)
  //       .update({
  //         'actName': actName,
  //         'startTime': startTime,
  //         'endTime': endTime,
  //         'cat': cat,
  //         'isTimeTable': isTimeTable,
  //       })
  //       .then((e) => {
  //             print('Document Updated $startTime'),
  //             print(startTime),
  //           })
  //       .catchError((e) => {
  //             print('Error updating document: ' + e),
  //           });
  // }

  // Future removeEvent(String id) async {
  //   return await eventCollection
  //       .doc(uid)
  //       .collection('myevent')
  //       .doc(id)
  //       .delete()
  //       .then((e) => {
  //             print('Document Removed $id'),
  //             print(id),
  //           })
  //       .catchError((e) => {
  //             print('Error removing document: ' + e),
  //           });
  // }

  // Future removeSubject(String id) async {
  //   return await eventCollection
  //       .doc(uid)
  //       .collection('mysubject')
  //       .doc(id)
  //       .delete()
  //       .then((e) => {
  //             print('Document Removed $id'),
  //             print(id),
  //           })
  //       .catchError((e) => {
  //             print('Error removing document: ' + e),
  //           });
  // }

  // List<Event> _eventListFromSnapshot(QuerySnapshot snapshot) {
  //   return snapshot.docs.map((doc) {
  //     return Event(
  //       id: doc.data()['id'],
  //       event: doc.data()['actName'],
  //       start: doc.data()['startTime'],
  //       stop: doc.data()['endTime'],
  //       cat: doc.data()['cat'],
  //       isTimeTable: doc.data()['isTimeTable'],
  //     );
  //   }).toList();
  // }

  List<Cheese> _cheeseListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Cheese(
          title: doc.data()['title'],
          url: doc.data()['url'],
          author: doc.data()['author'],
          uid: doc.data()['user'],
          id: doc.id,
          fav: doc.data()['fav']);
    }).toList();
  }

  Stream<List<Cheese>> get myCheese {
    print('getCheeseHasbeencalled');
    print(uid);
    return eventCollection.snapshots().map(_cheeseListFromSnapshot);
  }

  Future<List<Cheese>> get allCheese {
    var cheeseList = List<Cheese>.empty(growable: true);
    print(uid);
    print('getCheeseNAAAAHasbeencalled');
    print(uid);
    return eventCollection.get().then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        Cheese c = new Cheese(
            title: doc.data()['title'],
            url: doc.data()['url'],
            author: doc.data()['author'],
            uid: doc.data()['user'],
            id: doc.id,
            fav: doc.data()['fav']);

        cheeseList.add(c);
      });
      return cheeseList;
    });
  }

//   Future<List<Event>> get mySubject {
//     var eventList = List<Event>.empty(growable: true);
//     print(uid);
//     print('getEventNAAAAHasbeencalled');
//     print(uid);
//     return eventCollection
//         .doc(uid)
//         .collection('mysubject')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       querySnapshot.docs.forEach((doc) {
//         Event e = new Event(
//           id: doc.data()['id'],
//           event: doc.data()['subject'],
//           start: doc.data()['startTime'].toDate(),
//           stop: doc.data()['endTime'].toDate(),
//           cat: doc.data()['cat'],
//         );

//         eventList.add(e);
//       });
//       return eventList;
//     });
//   }

//   Future<dynamic> get getSemesterPeriod {
//     print(uid);
//     print('getSemesterPeriodHasbeencalled');
//     print(uid);
//     return eventCollection
//         .doc(uid)
//         .collection('mysemester')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       return {
//         "startSemester": querySnapshot.docs[0].data()['startSemester'].toDate(),
//         "endSemester": querySnapshot.docs[0].data()['endSemester'].toDate(),
//       };
//     });
//   }

//   Stream<List<Event>> get myEvent {
//     print('getEventHasbeencalled');
//     print(uid);
//     return eventCollection
//         .doc(uid)
//         .collection('myevent')
//         .snapshots()
//         .map(_eventListFromSnapshot);
//   }

//   Stream<Map<String, int>> get categories {
//     print('get');
//     return eventCollection
//         .doc(uid)
//         .collection('myevent')
//         .snapshots()
//         .map(_categoriesFromSnapshot);
//   }

//   Map<String, int> _categoriesFromSnapshot(QuerySnapshot snapshot) {
//     Map<String, int> map = {};

//     snapshot.docs.forEach((doc) {
//       if (!map.containsKey(doc.data()['cat'])) {
//         map[doc.data()['cat']] = 0;
//       }
//       map[doc.data()['cat']] += 1;
//     });
//     print(map);
//     return map;
//   }
// }
}
