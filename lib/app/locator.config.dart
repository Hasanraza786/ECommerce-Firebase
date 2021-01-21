// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:eCommerce/services/AuthService.dart';
import 'package:eCommerce/services/storageService.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import '../services/Services.dart';
import '../services/ThemeService.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final services = _$Services();
  gh.lazySingleton<DialogService>(() => services.dialogService);
  gh.lazySingleton<NavigationService>(() => services.navigationService);
  gh.lazySingleton<ThemeService>(() => services.themeService);
  gh.lazySingleton<AuthService>(() => services.authService);
  gh.lazySingleton<StorageService>(() => services.storageService);
  return get;
}

class _$Services extends Services {
  @override
  DialogService get dialogService => DialogService();
  @override
  @override
  NavigationService get navigationService => NavigationService();
  @override
  ThemeService get themeService => ThemeService();
  @override
  AuthService get authService => AuthService();
  @override
  StorageService get storageService => StorageService();
}
