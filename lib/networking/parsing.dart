// СТРУКТУРА ДЛЯ ГРУЗОВ
import 'package:isar/isar.dart';
import '../Collections/transit_col.dart';
import '../vars/variables.dart';

void getTransitInfo() async {
  await isar.writeTxn(() async {
    await isar.transits.clear();
    for (var el in transits) {
      final newStatusInfo = StatusInfo()
        ..id = el['status_info']['status_id']
        ..statusName = el['status_info']['status']
        ..statusDate = el['status_info']['date'];
      final newDocs = Docs()..name = 'hh';
      final newTransit = Transit()
        ..id = int.parse(el['id'])
        ..numberClient = el['number_client']
        ..destination = el['destination']
        ..weight = el['weight_b']
        ..dopSum = double.parse(el['full_info']['dop_sum'].toString())
        ..countPlaces = el['full_info']['count_places']
        ..volume = el['volume']
        ..density = el['full_info']['density']
        ..batch = el['batch']
        ..docs.value = newDocs
        ..statusInfo.value = newStatusInfo;
      await isar.transits.put(newTransit);
      await isar.statusInfos.put(newStatusInfo);
      await isar.docs.put(newDocs);
      await newTransit.docs.save();
      await newTransit.statusInfo.save();
    }
  });
  transitsList = await readTransits();

}

Future<List<Transit>> readTransits() async {
  final allTransits = await isar.transits.where().findAll();
  return allTransits;
}
