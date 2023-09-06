import 'package:isar/isar.dart';
part 'status_col.g.dart';


@collection
class Status {
  Id id = Isar.autoIncrement;
  late String name;
}