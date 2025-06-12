import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:store_app/app/components/common/widgets/text_app.dart';
import 'package:store_app/app/routes/app_pages.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

class ReorderableListGloceryViewWidget extends StatefulWidget {
  const ReorderableListGloceryViewWidget({Key? key}) : super(key: key);

  @override
  _ReorderableListGloceryViewWidgetState createState() =>
      _ReorderableListGloceryViewWidgetState();
}

class _ReorderableListGloceryViewWidgetState
    extends State<ReorderableListGloceryViewWidget> {
  final List<String> _products = [
    'Sunday Grocery',
    'Weekly Grocery',
    'Monday Grocery',
    'Monthly Grocery',
  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: _products.length,
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        final productName = _products[index];
        return Card(
          key: ValueKey(productName),
          margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4,
          child: ListTile(
            onTap: () => context.pushNamed(AppPages.CUST_GROCERY_LIST_ITEMS),
            dense: true,
            contentPadding:
            EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
            leading: CachedNetworkImage(
              height: 50,
              width: 50.w,
              imageUrl:
              'https://thumbs.dreamstime.com/b/online-purchase-logo-illustration-art-isolated-background-40522313.jpg',
              placeholder: (context, url) =>
                  CircularProgressIndicator(strokeWidth: 2),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            title: TextApp(
              text: productName,
              theme: context.textTheme.bodyLarge!.copyWith(
                fontSize: 14.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: TextApp(
              text: "$index items",
              theme: context.textTheme.bodyLarge!.copyWith(
                fontSize: 14.sp,
                color: context.theme.hintColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: context.theme.hintColor,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            tileColor: Colors.white,
          ),
        );
      },
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) newIndex -= 1;
          final item = _products.removeAt(oldIndex);
          _products.insert(newIndex, item);
        });
      },
    );
  }
}