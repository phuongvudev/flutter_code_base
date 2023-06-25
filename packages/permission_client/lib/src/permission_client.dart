import 'package:permission_handler/permission_handler.dart';

export 'package:permission_handler/permission_handler.dart'
    show PermissionStatus, PermissionStatusGetters;

/// {@template permission_client}
/// A client that handles requesting permissions on a device.
/// {@endtemplate}
abstract class PermissionClient {
  /// Request access to the device's permission,
  /// if access hasn't been previously granted.
  Future<PermissionStatus> request();

  /// Returns a permission status for the device's permission.
  Future<PermissionStatus> status();

  /// Opens the app settings page.
  ///
  /// Returns true if the settings could be opened, otherwise false.
  Future<bool> openPermissionSettings() => openAppSettings();
}

/// {@template permission_client}
/// A client that handles requesting notification permissions on a device.
/// {@endtemplate}
class NotificationPermissionClient extends PermissionClient {
  @override
  Future<PermissionStatus> request() {
    return Permission.notification.request();
  }

  @override
  Future<PermissionStatus> status() {
    return Permission.notification.status;
  }
}
