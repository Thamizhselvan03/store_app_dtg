import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:store_app/app/components/common/widgets/text_app.dart';
import 'package:store_app/app/components/global-widgets/main_appbar.dart';
import 'package:store_app/app/components/global-widgets/my_buttons.dart';
import 'package:store_app/app/routes/app_pages.dart';
import 'package:store_app/config/extensions/context_extensions.dart';
import 'package:store_app/app/components/common/dialogs/custom_dialogs.dart';
import 'package:store_app/app/components/global-widgets/Custom_card.dart';

import '../controllers/qr_scanner_controller.dart';

class QrScannerView extends StatefulWidget {
  const QrScannerView({super.key});

  @override
  State<QrScannerView> createState() => _QrScannerViewState();
}

class _QrScannerViewState extends State<QrScannerView> {
  MobileScannerController scannerController = MobileScannerController();
  final QrScannerController _ctrl = Get.put(QrScannerController());
  bool isScanned = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      if (mounted) {
        CustomDialog.CustomShowDialog(
          context: context,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                TextApp(
                  text: "Select your Grocery List from Below",
                  theme: context.textTheme.titleLarge!,
                ),
                SizedBox(height: 15.h),
                for (var k = 0; k < 3; k++)
                  CustomCard1(
                    leading: Radio.adaptive(
                      value: 1,
                      groupValue: 1,
                      onChanged: (v) {},
                    ),
                    title: "Shop name",
                    desc: "17 items",
                  ),
                SizedBox(height: 15.h),
                SizedBox(
                  height: 45,
                  child: PrimaryButton(
                    width: double.maxFinite,
                    onPressed: () {
                      Get.close(1);
                    },
                    inactive: false,
                    title: "Start Shopping",
                  ),
                ),
                SizedBox(height: 5.h),
              ],
            ),
          ),
        );
      }
    });
  }

  @override
  Future<void> dispose() async {
    await scannerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(prefixAction: () {}, title: "Scan Map QR"),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          spacing: 5.h,
          children: [
            SizedBox(height: 20.h),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height * .4,

                  child: MobileScanner(
                    useAppLifecycleState: true,
                    controller: scannerController,
                    fit: BoxFit.cover,
                    onDetect: (capture) async {
                      if (isScanned) return;
                      isScanned = true;

                      final List<Barcode> barcodes = capture.barcodes;
                      if (barcodes.isNotEmpty) {
                        final String code = barcodes.first.rawValue ?? "---";
                        _ctrl.setScannedCode(code);

                        // STOP camera before navigation
                        await scannerController.stop();

                        // Delay to allow camera frame buffers to clear
                        await Future.delayed(Duration(milliseconds: 300));

                        if (mounted) {
                          Get.snackbar("QR Code", code);
                          context.pushNamed(AppPages.CUSTOMER_HOME);
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            TextApp(
              text: "Scan the Qr code Load the Map",
              theme: context.textTheme.bodyLarge!,
            ),

            Text(
              'After that you can select your grocery list',
              style: context.textTheme.bodyMedium!.copyWith(
                color: context.theme.hintColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: TextApp(
                text: "Recently Visited Shop",
                theme: context.textTheme.titleLarge!.copyWith(fontSize: 17.sp),
                textAlign: TextAlign.left,
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10.r),
                    ),
                    child: ListTile(
                      minTileHeight: 60.h,
                      leading: CachedNetworkImage(
                        height: 50,
                        width: 50,
                        imageUrl:
                            'https://img.freepik.com/free-vector/shop-with-sign-we-are-open_23-2148547718.jpg?semt=ais_hybrid&w=740',
                      ),
                      title: TextApp(
                        text: "Greens",
                        theme: context.textTheme.bodyLarge!,
                      ),

                      trailing: IconButton(
                        constraints: BoxConstraints.tight(Size.fromWidth(20)),
                        onPressed: () {},
                        icon: Icon(Icons.more_vert),
                        color: context.theme.hintColor,
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
  }
}
