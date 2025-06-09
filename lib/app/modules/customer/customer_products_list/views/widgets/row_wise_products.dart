import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../components/common/widgets/custom_container_linear_admin.dart';
import '../../../../../components/common/widgets/text_app.dart';
import 'item_cart.dart';

class RowWiseProducts extends StatelessWidget {
  const RowWiseProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 5),
              CustomContainerLinearAdmin(
                gradient: LinearGradient(
                  colors: [
                    context.theme.primaryColor,
                    context.theme.primaryColor.withValues(alpha: 0.8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                height: 100,
                width: 40,
                child: Center(
                  child: TextApp(
                    text: 'R${index + 1}',
                    theme: context.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              Expanded(child: ItemCart(cart: demoCarts[index])),
            ],
          ),
        ),
      ),
    );
  }
}
