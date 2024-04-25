import 'package:e_commerce_app/config/role_config.dart';

enum Flavor {
  user(1),
  admin(2);

  final int roleValue;
  const Flavor(this.roleValue);

  @override
  String toString() => "You logged in as ${name.toUpperCase()}";
}

class FlavorValues {
  final RoleConfig roleConfig;

  FlavorValues({
    required this.roleConfig,
  });
}

class FlavorConfig {
  final Flavor flavor;
  final FlavorValues flavorValues;
  static late FlavorConfig _instance;

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues flavorValues,
  }) {
    _instance = FlavorConfig._internal(flavor, flavorValues);

    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.flavorValues);
  static FlavorConfig get instance {
    return _instance;
  }

  static bool isUser() => _instance.flavor == Flavor.user;
  static bool isAdmin() => _instance.flavor == Flavor.admin;
}
