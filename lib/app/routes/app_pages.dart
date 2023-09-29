import 'package:get/get.dart';

import '../modules/expend/bindings/expend_binding.dart';
import '../modules/expend/views/expend_view.dart';
import '../modules/income/bindings/add_income_binding.dart';
import '../modules/income/views/add_income_view.dart';
import '../modules/detail_cash_flow/bindings/detail_cash_flow_binding.dart';
import '../modules/detail_cash_flow/views/detail_flow_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ADD_INCOME,
      page: () => IncomeView(),
      binding: IncomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EXPENSE,
      page: () => ExpendView(),
      binding: ExpendBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_CASH_FLOW,
      page: () => DetailCashFlowView(),
      binding: DetailCashFlowBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => SettingView(),
      binding: SettingBinding(),
    ),
  ];
}
