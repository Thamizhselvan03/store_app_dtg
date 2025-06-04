import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/app/components/common/bottom_shet/custom_bottom_sheet.dart';
import 'package:store_app/app/components/common/widgets/text_app.dart';
import 'package:store_app/app/components/global-widgets/main_appbar.dart';
import 'package:store_app/app/components/global-widgets/my_buttons.dart';
import 'package:store_app/app/modules/customer/customer_home/views/widgets/racks_list.dart';
import 'package:store_app/app/modules/customer/customer_home/views/widgets/search_products.dart';
import '../../../../components/global-widgets/floating_drag_button.dart';
import '../controllers/customer_home_controller.dart';

class CustomerHomeView extends GetView<CustomerHomeController> {
  const CustomerHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: MainAppBar(
        prefixAction: () {
          Get.back();
        },
        title: 'All Products',
        suffix: [
          IconButton(
            onPressed: () {
              CustomBottomSheet.showModalBottomSheetContainer(
                backgroundColor: Colors.white,
                context: context,
                widget: SizedBox(
                  height: 300.h,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextApp(
                            text: "Items 2 out of 16",
                            theme: context.textTheme.bodyLarge!,
                          ),
                          TextButtonWithIcon(
                            title: "Add new",
                            onPressed: () {},
                            iconData: Icons.add,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: CachedNetworkImage(
                                height: 50,
                                width: 50,
                                imageUrl:
                                    'https://5.imimg.com/data5/AK/RA/MY-68428614/apple-1000x1000.jpg',
                              ),
                              title: TextApp(
                                text: "Apple",
                                theme: context.textTheme.bodyLarge!,
                              ),
                              trailing: index == 2
                                  ? SizedBox(
                                      height: 40,
                                      child: PrimaryButton(
                                        backgroundColor: context.iconColor,
                                        onPressed: () {},
                                        inactive: false,
                                        child: TextApp(
                                          text: 'Mark as collected',
                                          theme: context.textTheme.bodyMedium!
                                              .copyWith(color: Colors.white),
                                        ).paddingSymmetric(horizontal: 5.w),
                                      ),
                                    )
                                  : TextApp(
                                      text: "Collected",
                                      theme: context.textTheme.bodyMedium!
                                          .copyWith(
                                            color: context.theme.hintColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart_outlined, color: context.iconColor),
          ),
        ],
      ),
      body: Column(
        children: [
          // Search For Users
          SearchProducts(),
          SizedBox(height: 10.h),
          RackList(),
        ],
      ),
    );
  }
}
