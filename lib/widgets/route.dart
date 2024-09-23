import 'package:africanstraw/components/customer_profile.dart';
import 'package:africanstraw/components/mobile_shop.dart';
import 'package:africanstraw/components/shop.dart';
import 'package:africanstraw/components/single_product.dart';
import 'package:africanstraw/forms/check_out.dart';
import 'package:africanstraw/forms/register_page.dart';
import 'package:africanstraw/forms/reset_password.dart';
import 'package:africanstraw/forms/signin_page.dart';
import 'package:africanstraw/pages/about.dart';
import 'package:africanstraw/pages/contact.dart';
import 'package:africanstraw/pages/customer_direction.dart';
import 'package:africanstraw/pages/our_team.dart';
import 'package:africanstraw/pages/reshaping_basket.dart';
import 'package:africanstraw/pages/return_policy.dart';
import 'package:africanstraw/pages/shipping_process.dart';
import 'package:africanstraw/pages/terms.dart';
import 'package:africanstraw/pages/wholesale.dart';
import 'package:africanstraw/responsive/desktop_scaffold.dart';
import 'package:africanstraw/responsive/mobile_scaffold.dart';
import 'package:africanstraw/responsive/responsive_layout.dart';
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
  static String contactPage="contactPage";
  static String customerDirection="customerDirection";
  static String ourTeam="ourTeam";
  static String wholesale="wholesale";
  static String terms="terms";
  static String returns="returns";
  static String shipping="shipping";
  static String reshape="reshape";
  static String userProfile="userProfile";
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
  Routes.contactPage:(context)=>const ContactPage(),
  Routes.customerDirection:(context)=>const CustomerDirection(),
  Routes.ourTeam:(context)=>const OurTeam(),
  Routes.wholesale:(context)=>const Wholesale(),
  Routes.terms:(context)=>const TermsAndConditions(),
  Routes.returns:(context)=>const ReturnPolicy(),
  Routes.shipping:(context)=>const ShippingProcess(),
  Routes.reshape:(context)=>const ReshapingBasket(),
  Routes.userProfile:(context)=> CustomerProfilePage(),
  Routes.mainShop:(context)=>const ResponsiveLayout(isMobile: ShopPage(), isTablet: ShopPage(), isDesktop: ShopPage(),),
  Routes.dashboard:(context)=>const ResponsiveLayout(isMobile: DesktopScaffold(), isTablet: DesktopScaffold(), isDesktop: DesktopScaffold(),
  ),
};