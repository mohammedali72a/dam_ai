import 'package:cloud_firestore/cloud_firestore.dart';

Map<String, dynamic> transformDocToMap(DocumentSnapshot doc) {
  final docData = doc.data() as Map<String, dynamic>;
  docData["id"] = doc.id;
  return _transformDocToMap(docData);
}

Map<String, dynamic> _transformDocToMap(Map<String, dynamic> doc) {
  for (final entry in doc.entries) {
    final key = entry.key;
    final value = entry.value;

    if (value is DocumentReference) {
      doc[key] = value.id;
    } else if (value is Timestamp) {
      doc[key] = value.toDate();
    } else if (value is List) {
      doc[key] = value
          .map((item) => _transformDocToMap({"item": item})["item"])
          .toList();
    } else if (value is Map<String, dynamic>) {
      doc[key] = _transformDocToMap(value);
    }
  }

  return doc;
}
