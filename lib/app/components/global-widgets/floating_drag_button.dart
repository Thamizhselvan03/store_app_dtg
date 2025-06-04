import 'package:flutter/material.dart';

import 'package:floating_draggable_widget/floating_draggable_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../common/bottom_shet/custom_bottom_sheet.dart';

class FloatingDragButton extends StatelessWidget {
  const FloatingDragButton({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FloatingDraggableWidget(
      autoAlignType: AlignmentType.onlyRight,
      onDeleteWidget: null,
      floatingWidget:Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
            color:  context.theme.primaryColor,
          borderRadius: BorderRadius.circular(50)
        ),

        child:  Icon(Icons.shopping_cart_checkout_sharp,color: Colors.white,),
      ),
   
      
      
      
      onDragEvent: (dx, dy) {
        print("$dx, $dy");
      },
      onDragging: (val) {
        print("on dragging $val");
      },
      autoAlign: true,
      disableBounceAnimation: true,
      // autoAlignType: AlignmentType.both,
      floatingWidgetHeight: 50,
      floatingWidgetWidth: 50,

      // dx: 300,
      // dy: 300,
      mainScreenWidget: child,
    );
  }
}
