import 'package:flutter/material.dart';
import 'package:eCommerce/ui/AppViewModel.dart';
import 'package:eCommerce/app/locator.dart';
import 'package:eCommerce/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppViewModel>.reactive(
      builder: (context, model, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'eCommerce',
          theme: model.isDarkMode ? model.darkTheme : model.lightTheme,
          initialRoute: Routes.startupView,
          onGenerateRoute: Routerr().onGenerateRoute,
          navigatorKey: locator<NavigationService>().navigatorKey,
        );
      },
      viewModelBuilder: () => AppViewModel(),
    );
  }
}
