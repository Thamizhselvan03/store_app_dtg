import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:store_app/app/routes/app_pages.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

import '../../../../../components/common/style/fonts/font_family_helper.dart';
import '../../../../../components/common/style/fonts/font_weight_helper.dart';
import '../../../../../components/common/widgets/text_app.dart';


class RackList extends StatelessWidget {
  const RackList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MasonryGridView.builder(
        padding: EdgeInsets.only(bottom: 20, left: 5, right: 5),
        shrinkWrap: true,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 18,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(AppPages.CUSTOMER_PRODUCTS_LIST);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => FoodCategories()),
                // );
              },
              child: Container(
                height: 100,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  // color: const Color(0xFFF5F6F9),
                  color: index % 2 == 0
                      ? const Color(0xFFF5F6F9)
                      : Get.theme.primaryColor.withValues(alpha: .1),
                  border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: TextApp(
                    text: 'Rack ${index + 1}',
                    theme: context.textTheme.bodyLarge!.copyWith(
                      fontFamily: FontFamilyHelper.poppinsEnglish,
                      fontSize: 14.sp,
                      fontWeight: FontWeightHelper.medium,
                    ),
                  ),
                ),
              ),
            ),
          );

          //   ListView.builder(
          //
          //   physics: BouncingScrollPhysics(),
          //   itemCount: 10,
          //
          //   itemBuilder: (context, index) {
          //     return const  FoodCategories();
          //   },
          // );
        },
      ),
    );
  }
}
