import 'package:flutter/material.dart';
import 'package:store_app/app/modules/customer/customer_home/controllers/customer_home_controller.dart';

import '../../../../../components/common/widgets/custom_text_field.dart';
import 'package:get/get.dart';

class SearchProducts extends StatelessWidget {
  SearchProducts({super.key});

  final CustomerHomeController _ctrl = Get.put(CustomerHomeController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CustomTextField(
        controller: _ctrl.searchController,
        keyboardType: TextInputType.emailAddress,
        filled: true,
        fillColour: Colors.white,
        hintText: 'Search for products',
        onChanged: (value) {},
        suffixIcon: Obx(
          () => IconButton(
            icon: Icon(
              _ctrl.isListening.value ? Icons.mic : Icons.mic_none,
              color: context.theme.primaryColor,
            ),
            onPressed: _ctrl.isListening.value
                ? _ctrl.stopListening
                : _ctrl.startListening,
          ),
        ),
        // suffixIcon: IconButton(
        //   onPressed: () {
        //     //  bloc.searchController.clear();
        //     //  bloc.add(const GetAllUsersEvent.getAllUsers(isNotLoading: true));
        //   },
        //   icon: bloc.searchController.text.isEmpty
        //       ? const SizedBox.shrink()
        //       : const Icon(Icons.clear, color: ColorsDark.blueLight),
        // ),
      ),
    );
  }
}
