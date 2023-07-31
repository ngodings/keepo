enum PermissionEnum {
  location('location'),
  camera('camera'),
  contact('contact'),
  microphone('microphone'),
  gallery('gallery'),
  notification('notification');

  const PermissionEnum(this.type);
  final String type;
}

// Using an extension
// Enhanced enums

extension ConvertPermission on String {
  PermissionEnum toEnum() {
    switch (this) {
      case 'location':
        return PermissionEnum.location;
      case 'camera':
        return PermissionEnum.camera;
      case 'contact':
        return PermissionEnum.contact;
      case 'microphone':
        return PermissionEnum.microphone;
      case 'gallery':
        return PermissionEnum.gallery;
      case 'notification':
        return PermissionEnum.notification;
      default:
        return PermissionEnum.location;
    }
  }
}
