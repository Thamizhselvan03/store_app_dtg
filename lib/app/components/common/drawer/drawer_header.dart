import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store_app/config/extensions/context_extensions.dart';

import '../style/colors/colors_dark.dart';
import '../style/fonts/font_weight_helper.dart';
import '../widgets/text_app.dart';
import 'custom_rich_text.dart';


class TwitterDrawerHeader extends StatelessWidget {
  const TwitterDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195,
      child: Container(

        decoration: BoxDecoration(gradient: LinearGradient(colors: [
          context.theme.primaryColor,
          context.theme.colorScheme.secondary,
        ])),
          padding: const EdgeInsets.fromLTRB(16, 45, 16, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                  ),
                  const Spacer(),
                  // IconButton(
                  //     onPressed: () {},
                  //     icon: Icon(Icons.logout)
                  //     // SvgPicture.asset(
                  //     //   'assets/more_vert.svg',
                  //     //   colorFilter: const ColorFilter.mode(
                  //     //       Colors.black, BlendMode.srcIn),
                  //     // )
                  // )
                ],
              ),
              const Spacer(),
               Text(
              'Tam',
                style: context.textStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeightHelper.bold,
                    color: Colors.white),
                textHeightBehavior: TextHeightBehavior(
                    applyHeightToFirstAscent: false,
                    applyHeightToLastDescent: false),
              ),
              TextApp(
                text:'@tam_g5',
                theme: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70),
              ),
              const Spacer(),
              const Row(
                children: [
                  CustomRichText(info: '100', title: 'user'),

                ],
              ),
              const SizedBox(height: 10)
            ],
          )),
    );
  }
}
