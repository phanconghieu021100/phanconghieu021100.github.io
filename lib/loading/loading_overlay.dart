import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:phanconghieu020100/loading/loading_controller.dart';

class LoadingOverlayV1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isLoading = Get.find<LoadingController>().isLoading.value;
      return isLoading
          ? Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                    child: Center(
                      child: Image.asset(
                        'assets/images/loading_airdata.gif', // Update to use your image path
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : SizedBox.shrink();
    });
  }
}

class LoadingOverlay extends StatelessWidget {
  final Widget child;

   LoadingOverlay({Key? key, required this.child}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     final LoadingController loadingController = Get.find();

    return Obx(() {
      return Stack(
        children: [
          child,
          if (loadingController.isLoading.value)
            Positioned.fill(
              child: Container(
                color: Colors.black.withOpacity(0.1),
                child: Center(
                  child: Image.asset(
                    'assets/images/loading_airdata.gif', // Cập nhật đường dẫn hình ảnh của bạn
                    width: 120,
                    height: 120,
                  ),
                ),
              ),
            ),
        ],
      );
    });
  }
}

// class LoadingOverlay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {

//     final LoadingController loadingController = Get.find();
//     return Obx(() {
//       return loadingController.isLoading.value
//           ? Container(
//               color: Colors.black54,
//               child: Center(
//                 child: Image.asset(
//                   'assets/images/loading_airdata.gif', 
//                   height: 120,
//                 ),
//               ))
//           : SizedBox.shrink();
//     });
//   }
// }
