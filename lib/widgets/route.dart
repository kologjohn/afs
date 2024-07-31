import 'package:africanstraw/components/mobile_shop.dart';
import 'package:africanstraw/components/shop.dart';
import 'package:africanstraw/components/single_product.dart';
import 'package:africanstraw/components/tablet_shop.dart';
import 'package:africanstraw/forms/check_out.dart';
import 'package:africanstraw/forms/register_page.dart';
import 'package:africanstraw/forms/reset_password.dart';
import 'package:africanstraw/forms/signin_page.dart';
import 'package:africanstraw/pages/about.dart';
import 'package:africanstraw/responsive/desktop_scaffold.dart';
import 'package:africanstraw/responsive/mobile_scaffold.dart';
import 'package:africanstraw/responsive/responsive_layout.dart';
import 'package:africanstraw/responsive/tablet_scaffold.dart';
import 'package:africanstraw/tables/checkout_table.dart';
import 'package:africanstraw/widgets/cart.dart';

class Routes{
  static String cart="cart";
  static String dashboard="dashboard";
  static String mainShop="mainShop";
  static String singleProduct="singleProduct";
  static String login="login";
  static String signup="signup";
  static String checkout="checkout";
  static String table="table";
  static String resetPassword="resetPassword";
  static String about="about";
}

final pages={
  Routes.cart:(context)=>const CartView(),
  Routes.singleProduct:(context)=>const SingleProduct(),
  Routes.login:(context)=>const SignInPage(),
  Routes.signup:(context)=>const RegisterPage(),
  Routes.checkout:(context)=>CheckoutForm(),
  Routes.table:(context)=>TableExample(),
  Routes.resetPassword:(context)=>const ResetPassword(),
  Routes.about:(context)=>const AboutPage(),
  Routes.mainShop:(context)=>const ResponsiveLayout(isMobile: MobileShop(), isTablet: ShopPage(), isDesktop: ShopPage(),),
  Routes.dashboard:(context)=>const ResponsiveLayout(isMobile: MobileScaffold(), isTablet: DesktopScaffold(), isDesktop: DesktopScaffold(),
  ),
};