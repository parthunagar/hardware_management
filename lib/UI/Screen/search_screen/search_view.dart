import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vpn_scanner/Constant/app_image.dart';
import 'package:vpn_scanner/UI/Widget/custom_appbar.dart';

import 'search_controller.dart';

class SearchScreenWidget extends GetView<SearchScreenLogic> {
  const SearchScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final logic = Get.find<SearchScreenLogic>();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Search', // Const.appBarTitleAddCategory,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Image.asset(Assets.backArrow)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const [
              SizedBox()
          ],
        ),
      ),
    );
  }
}
