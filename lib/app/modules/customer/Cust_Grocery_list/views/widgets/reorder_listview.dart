import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/app/components/common/widgets/text_app.dart';
import 'package:store_app/app/routes/app_pages.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

class ReorderableListGloceryViewWidget extends StatefulWidget {
  const ReorderableListGloceryViewWidget({super.key});

  @override
  State<ReorderableListGloceryViewWidget> createState() =>
      _ReorderableListGloceryViewWidgetState();
}

class _ReorderableListGloceryViewWidgetState extends State<ReorderableListGloceryViewWidget> {
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
      itemBuilder: (context, index) {
        return Card(
          key: ValueKey(_products[index]),
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            onTap: (){
              context.pushNamed(AppPages.CUST_GROCERY_LIST_ITEMS);
            },
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
            leading: CachedNetworkImage(
              height: 50,
              width: 50.w,
              imageUrl:
                  'https://thumbs.dreamstime.com/b/online-purchase-logo-illustration-art-isolated-background-40522313.jpg',
            ),
            title: TextApp(
              text: _products[index],
              theme: context.textTheme.bodyLarge!.copyWith(
                color: Colors.black,

                fontSize: 14.sp,
              ),
            ),
            subtitle: TextApp(
              text: "${index} items",
              theme: context.textTheme.bodyLarge!.copyWith(
                color: context.theme.hintColor,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
              color: context.theme.hintColor,
            ),
            tileColor: Colors.white,
            iconColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final item = _products.removeAt(oldIndex);
          _products.insert(newIndex, item);
        });
      },
    );
  }
}
