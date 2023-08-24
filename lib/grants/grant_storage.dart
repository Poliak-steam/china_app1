import 'package:permission_handler/permission_handler.dart';
Map<Permission, PermissionStatus> statuses = {};

Future<PermissionStatus> requestPermission(Permission permission) async {

  if (await permission.isDenied) {
    await permission.request();
    statuses.addAll({permission: await permission.status});
  }
  return permission.status;
}