import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:store_app/app/components/common/widgets/text_app.dart';
import 'package:store_app/app/routes/app_pages.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

class GloceryItemsListWidget extends StatefulWidget {
  const GloceryItemsListWidget({super.key});

  @override
  State<GloceryItemsListWidget> createState() =>
      _GloceryItemsListWidgetState();
}

class _GloceryItemsListWidgetState extends State<GloceryItemsListWidget> {
  final List<String> _products = [
    'Apple',
    'Orange',
    'Milk',
    'Ghee',

  ];

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
      itemCount: _products.length,
      itemBuilder: (context, index) {
        return Card(
          key: ValueKey(_products[index]),
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
         minTileHeight: 52,
            onTap: (){
              context.pushNamed(AppPages.CUST_GROCERY_LIST_ITEMS);
            },
            dense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5),
            leading: CachedNetworkImage(
              height: 45,
              width: 45.w,
              imageUrl:
              'https://5.imimg.com/data5/AK/RA/MY-68428614/apple-1000x1000.jpg',
            ),
            title: TextApp(
              text: _products[index],
              theme: context.textTheme.bodyLarge!.copyWith(
                color: Colors.black,

                fontSize: 14.sp,
              ),
            ),
            subtitle: TextApp(
              text: "Qty: ${index}",
              theme: context.textTheme.bodyLarge!.copyWith(
                color: context.theme.hintColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: IconButton(

              onPressed: () {},
              icon: Icon(Icons.close,weight:.8 ,size: 20.sp,),
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
