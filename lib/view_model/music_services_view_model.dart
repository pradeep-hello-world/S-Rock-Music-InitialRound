import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import '../model/music_service.dart';

class MusicServicesViewModel extends ChangeNotifier {
  List<MusicService> _services = [];
  bool isLoading = true;

  List<MusicService> get services => _services;

  Future<void> fetchServices() async {
    try {
      isLoading = true;
      notifyListeners();

      final snapshot = await FirebaseFirestore.instance
          .collection('music_services')
          .get();

      _services = snapshot.docs
          .map((doc) => MusicService.fromDocument(doc))
          .toList();

      isLoading = false;
      notifyListeners();
    } catch (e) {
      print('Error fetching music services: $e');
      isLoading = false;
      notifyListeners();
    }
  }
}
