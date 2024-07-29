import 'package:get/get.dart';
import 'package:vpn_scanner/UI/Screen/add_category_screen/add_category_binding.dart';
import 'package:vpn_scanner/UI/Screen/add_category_screen/add_category_view.dart';
import 'package:vpn_scanner/UI/Screen/add_module/add_module_binding.dart';
import 'package:vpn_scanner/UI/Screen/add_module/add_module_view.dart';
import 'package:vpn_scanner/UI/Screen/category_detail_screen/category_screen_binding.dart';
import 'package:vpn_scanner/UI/Screen/category_detail_screen/category_screen_view.dart';
import 'package:vpn_scanner/UI/Screen/category_list_screen/category_list_binding.dart';
import 'package:vpn_scanner/UI/Screen/category_list_screen/category_list_view.dart';
import 'package:vpn_scanner/UI/Screen/dashboard_screen/dashboard_binding.dart';
import 'package:vpn_scanner/UI/Screen/dashboard_screen/dashboard_view.dart';
import 'package:vpn_scanner/UI/Screen/dynamic_map/dynamic_map_binding.dart';
import 'package:vpn_scanner/UI/Screen/dynamic_map/dynamic_map_view.dart';
import 'package:vpn_scanner/UI/Screen/edit_category/edit_category_binding.dart';
import 'package:vpn_scanner/UI/Screen/edit_category/edit_category_view.dart';
import 'package:vpn_scanner/UI/Screen/login_screen/login_binding.dart';
import 'package:vpn_scanner/UI/Screen/login_screen/login_view.dart';
import 'package:vpn_scanner/UI/Screen/qr_code_screen/qr_code_binding.dart';
import 'package:vpn_scanner/UI/Screen/qr_code_screen/qr_code_view.dart';
import 'package:vpn_scanner/UI/Screen/search_screen/search_binding.dart';
import 'package:vpn_scanner/UI/Screen/search_screen/search_view.dart';
import 'package:vpn_scanner/UI/Screen/suggest_textfield/suggest_textfield_binding.dart';
import 'package:vpn_scanner/UI/Screen/suggest_textfield/suggest_textfield_view.dart';
import 'package:vpn_scanner/UI/Screen/update_dynamic_view/update_dynamic_view_binding.dart';
import 'package:vpn_scanner/UI/Screen/update_dynamic_view/update_dynamic_view_view.dart';
import 'package:vpn_scanner/UI/Screen/view_module_list/view_module_list_binding.dart';
import 'package:vpn_scanner/UI/Screen/view_module_list/view_module_list_view.dart';


class AppRoutes {


  static String loginScreen = '/login_Screen';
  static String dashBoardScreen = '/dashboard_screen';
  static String categoryListScreen = '/category_list_screen';
  static String categoryDetailScreen = '/category_detail_screen';
  static String qrCodeScreen = '/qr_code_screen';
  static String addCategoryScreen = '/add_category_screen';
  static String editCategoryScreen = '/edit_category_screen';
  static String searchScreen = '/search_screen';
  static String addModuleScreen = '/add_module';
  static String viewModuleScreen = '/view_module';
  static String updateDynamicViewModuleScreen = '/update_dynamic_view_module';
  static String dynamicMapScreen = '/dynamic_map';
  static String autoSuggestTextField = '/auto_text_field';

  static String secondTimeCategoryDetailScreen = '/Screen/category_detail_screen/category_screen_view';

  static List<GetPage> pages = [
    GetPage(
      name: loginScreen,
      page: () =>  LoginScreenWidget(),
      bindings: [LoginScreenBinding()],
    ),
    GetPage(
      name: dashBoardScreen,
      page: () => const DashBoardScreenWidget(),
      bindings: [DashBoardScreenBinding()],
    ),
    GetPage(
      name: categoryListScreen,
      page: () => const CategoryListWidget(),
      bindings: [CategoryListBinding()],
    ),
    GetPage(
      name: categoryDetailScreen,
      page: () => const CategoryDetailScreenWidget(),
      bindings: [CategoryDetailScreenBinding()],
    ),
    GetPage(
      name: secondTimeCategoryDetailScreen,
      page: () => const CategoryDetailScreenWidget(),
      bindings: [CategoryDetailScreenBinding()],
    ),
    GetPage(
      name: qrCodeScreen,
      page: () => const QrCodeScreenWidget(),
      bindings: [QrCodeScreenBinding()],
    ),
    GetPage(
      name: addCategoryScreen,
      page: () => const AddCategoryWidget(),
      bindings: [AddCategoryBinding()],
    ),
    GetPage(
      name: editCategoryScreen,
      page: () => const EditCategoryWidget(),
      bindings: [EditCategoryBinding()],
    ),
    GetPage(
      name: searchScreen,
      page: () => SearchScreenWidget(),
      bindings: [SearchScreenBinding()],
    ),

    GetPage(
      name: addModuleScreen,
      page: () => AddModulePage(),
      bindings: [AddModuleBinding()],
    ),
    GetPage(
      name: viewModuleScreen,
      page: () => ViewModuleListPage(),
      bindings: [ViewModuleListBinding()],
    ),
    GetPage(
      name: updateDynamicViewModuleScreen,
      page: () => UpdateDynamicViewPage(),
      bindings: [UpdateDynamicViewBinding()],
    ),
    GetPage(
      name: dynamicMapScreen,
      page: () => DynamicMapPage(),
      bindings: [DynamicMapBinding()],
    ),
    GetPage(
      name: autoSuggestTextField,
      page: () => SuggestTextFieldPage(),
      bindings: [SuggestTextFieldBinding()],
    ),

    // GetPage(
    //   name: dashBoardScreen,
    //   page: () => MyDashBoard(),
    //   bindings: [DashBoardBindings()],
    // ),

  ];
}
