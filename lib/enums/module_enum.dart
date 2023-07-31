enum ModuleEnum {
  service('Service'),
  profile('Profile'),
  group('Group');

  const ModuleEnum(this.type);
  final String type;
}

extension ConvertModuleEnum on String {
  ModuleEnum toEnum() {
    switch (this) {
      case 'Group':
        return ModuleEnum.group;
      case 'Profile':
        return ModuleEnum.profile;
      case 'Service':
        return ModuleEnum.service;
      default:
        return ModuleEnum.profile;
    }
  }
}
