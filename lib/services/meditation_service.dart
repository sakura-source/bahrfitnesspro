import 'package:cloud_firestore/cloud_firestore.dart';

class MeditationService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Fetches the list of meditation tracks from Firestore.
  /// 
  /// Returns a list of meditation track names.
  /// Throws an error if the operation fails.
  Future<List<String>> getMeditationTracks() async {
    try {
      QuerySnapshot snapshot = await _db.collection('meditation_tracks').get();
      List<String> tracks = snapshot.docs.map((doc) => doc['name'] as String).toList();
      return tracks;
    } catch (e) {
      print('Error fetching meditation tracks: $e');
      return [];
    }
  }

  /// Fetches the URL of a specific meditation track from Firestore.
  /// 
  /// Takes the track's unique identifier [trackId].
  /// Returns the URL of the meditation track.
  /// Throws an error if the operation fails.
  Future<String> getMeditationTrackUrl(String trackId) async {
    try {
      DocumentSnapshot doc = await _db.collection('meditation_tracks').doc(trackId).get();
      return doc['url'] as String;
    } catch (e) {
      print('Error fetching meditation track URL: $e');
      return null;
    }
  }
}
