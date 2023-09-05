import 'package:isar/isar.dart';
part 'transit_col.g.dart';


@collection
class Transit {
  late Id id;
  late String numberClient;
  late String destination;
  late double weight;
  late double dopSum;
  late int countPlaces;
  late String volume;
  late double density;
  late String batch;
  final docs = IsarLink<Docs>();
  final statusInfo = IsarLink<StatusInfo>();
}

@collection
class Docs {
  late Id id = Isar.autoIncrement;
  late String name;
}

@collection
class StatusInfo {
  late Id id = Isar.autoIncrement;
  late String statusName;
  late String statusDate;
}