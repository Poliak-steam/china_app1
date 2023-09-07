// СТРУКТУРА ДЛЯ ГРУЗОВ
import 'package:hl_flutter_app/Collections/status_col.dart';
import 'package:isar/isar.dart';
import '../Collections/transit_col.dart';
import '../vars/variables.dart';

Future<List<Transit>> getTransitInfo() async {
  List<Transit> allTransits = [];
  await isar.writeTxn(() async {
    await isar.docs.clear();
    await isar.statusInfos.clear();
    await isar.transits.clear();
    for (var el in transits.values) {
      final newStatusInfo = StatusInfo()
        ..id = el['status_info']['status_id']
        ..statusName = el['status_info']['status']
        ..statusDate = el['status_info']['date'];
      final newDocs = Docs()..name = (el['full_info']['account_document'] != '') ? el['full_info']['account_document']['name'] :'no files';
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
    allTransits = await isar.transits.where().findAll();
  });
  return allTransits;
}

Future<List<Status>> getStatusInfo() async {
  List<Status> allStatuses = [];
  await isar.writeTxn(() async {
    await isar.status.clear();
    for (var el in statuses) {
      final newStatus = Status()..name = el['name'];
      await isar.status.put(newStatus);
    }

    allStatuses = await isar.status.where().findAll();
  });
  return allStatuses;
}
