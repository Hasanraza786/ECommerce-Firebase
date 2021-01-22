import 'package:auto_route/auto_route_annotations.dart';
import 'package:eCommerce/ui/views/About/aboutView.dart';
import 'package:eCommerce/ui/views/Cart/cartView.dart';
import 'package:eCommerce/ui/views/CheckOut/checkOutView.dart';
import 'package:eCommerce/ui/views/ContactUs/contactUsView.dart';
import 'package:eCommerce/ui/views/DetailScreen/detailView.dart';
import 'package:eCommerce/ui/views/Home/homeView.dart';
import 'package:eCommerce/ui/views/ProductList/productListView.dart';
import 'package:eCommerce/ui/views/SignUp/signUpVIew.dart';
import 'package:eCommerce/ui/views/Welcome/welcomeView.dart';
import 'package:eCommerce/ui/views/login/LoginView.dart';
import 'package:eCommerce/ui/views/startup/StartupView.dart';
import 'package:eCommerce/ui/views/ProfileView/profileView.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: StartupView, initial: true),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: HomeView),
    MaterialRoute(page: ProductListView),
    MaterialRoute(page: DetailView),
    MaterialRoute(page: CartView),
    MaterialRoute(page: CheckOutView),
    MaterialRoute(page: WelcomeView),
    MaterialRoute(page: ProfileView),
    MaterialRoute(page: ContactUsView),
    MaterialRoute(page: AboutView),
  ],
)
class $Router {}
