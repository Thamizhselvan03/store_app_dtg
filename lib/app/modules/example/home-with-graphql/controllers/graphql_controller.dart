import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


import '../../../../components/navbar/navbar_controller.dart';
import '../../../../service/handler/exception_handler.dart';
import '../../home-with-restAPI/controllers/home_controller.dart';
import '../models/country_model.dart';

class GraphQLController extends GetxController with ExceptionHandler {
  final navController = Get.put(NavbarController());

  final countryList = RxList<Countries>();
  RxString mutationResult = "".obs;

  /////////////////////   QUERY /////////////////////////

  Future<void> getCountries() async {
    showLoading();
    // Build your query string
    const query = """
    query Query{
   countries {
    code
    name
    emoji
  }
 
}
    """;

    final result =
        await graphQLService.performQuery(query).catchError(handleGraphqlError);
    if (result == null) return;

    countryList.assignAll((result["countries"] as List)
        .map((e) => Countries.fromJson(e))
        .toList());

    hideLoading();
  }

  ///

  @override
  void onReady() async {
    await getCountries();
    Get.find<HomeController>().bottomPadding.value = 18.sp;
    super.onReady();
  }
}
