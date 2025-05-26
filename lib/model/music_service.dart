import 'package:cloud_firestore/cloud_firestore.dart';

class MusicService {
  final String id;
  final String title;
  final String description;
  final String iconPath;

  MusicService({
    required this.id,
    required this.title,
    required this.description,
    required this.iconPath,
  });

  factory MusicService.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MusicService(
      id: doc.id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      iconPath: data['iconPath'] ?? '',
    );
  }
}
