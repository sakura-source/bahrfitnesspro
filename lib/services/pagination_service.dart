import 'package:cloud_firestore/cloud_firestore.dart';

class PaginationService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<DocumentSnapshot>> fetchPaginatedData(
      String collectionPath, int limit,
      {DocumentSnapshot lastDocument}) async {
    Query query = _db.collection(collectionPath).limit(limit);

    if (lastDocument != null) {
      query = query.startAfterDocument(lastDocument);
    }

    QuerySnapshot querySnapshot = await query.get();
    return querySnapshot.docs;
  }
}
