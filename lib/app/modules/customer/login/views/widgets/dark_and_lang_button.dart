// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
//
//
// class DarkAndLangButton extends StatelessWidget {
//   const DarkAndLangButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         // Dark Mode Button
//         BlocBuilder(
//           bloc: cubit,
//           builder: (context, state) {
//             return CustomFadeInRight(
//               duration: 400,
//               child: CustomLinearButton(
//                 onPressed: cubit.changeAppThemeMode,
//                 child: Icon(
//                   cubit.isDark
//                       ? Icons.light_mode_rounded
//                       : Icons.dark_mode_rounded,
//                   color: Colors.white,
//                 ),
//               ),
//             );
//           },
//         ),
//         // Language Button
//         BlocBuilder(
//           bloc: cubit,
//           builder: (context, state) {
//             return CustomFadeInLeft(
//               duration: 400,
//               child: CustomLinearButton(
//                 height: 44.h,
//                 width: 100.w,
//                 onPressed: () {
//                   if (AppLocalizations.of(context)!.isEnLocale) {
//                     cubit.toArabic();
//                   } else {
//                     cubit.toEnglish();
//                   }
//                 },
//                 child: TextApp(
//                   text: context.translate(LangKeys.language),
//                   theme: context.textStyle.copyWith(
//                     fontSize: 16.sp,
//                     fontWeight: FontWeightHelper.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }
