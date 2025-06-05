import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:store_app/app/components/common/widgets/text_app.dart';

import '../../admin_main/views/widgets/drawer_admin.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerAdmin(),
      appBar: AppBar(title: const Text('DashboardView'), centerTitle: true),
      body: Column(
        children: [
          Container(
            height: 100.w,
            child: Column(
              children: [
                TextApp(text: "Total ", theme: context.textTheme.bodyMedium!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
