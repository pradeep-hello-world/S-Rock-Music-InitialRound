import 'package:cloud_firestore/cloud_firestore.dart';
import '../model/music_service.dart';

class MusicServiceRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<MusicService>> fetchServices() async {
    final snapshot = await _firestore.collection('music_services').get();
    return snapshot.docs
        .map((doc) => MusicService.fromDocument(doc))
        .toList();
  }
}
