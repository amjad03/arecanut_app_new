import '../../../controller/carousel_controller/controller.dart';
import 'carousel_loading.dart';
import './carousel_with_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBannerSliderMobile extends StatelessWidget {
  const CustomBannerSliderMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () {
          if (carouselController.isLoading.value) {
            return const Center(
              child: CarouselLoadingMobile(),
            );
          } else {
            if (carouselController.carouselItemList.isNotEmpty) {
              return CarouselWithIndicatorMobile(
                  data: carouselController.carouselItemList);
            } else {
              return const Center(
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: const [
                  //     Icon(Icons.hourglass_empty),
                  //     Text("Loading ...")
                  //   ],
                  // ),
                  );
            }
          }
        },
      ),
    );
  }
}

class CustomBannerSliderTablet extends StatelessWidget {
  const CustomBannerSliderTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () {
          if (carouselController.isLoading.value) {
            return const Center(
              child: CarouselLoadingTablet(),
            );
          } else {
            if (carouselController.carouselItemList.isNotEmpty) {
              return CarouselWithIndicatorTablet(
                  data: carouselController.carouselItemList);
            } else {
              return const Center(
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: const [
                  //     Icon(Icons.hourglass_empty),
                  //     Text("Loading ...")
                  //   ],
                  // ),
                  );
            }
          }
        },
      ),
    );
  }
}

class CustomBannerSliderDesktop extends StatelessWidget {
  const CustomBannerSliderDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Obx(
        () {
          if (carouselController.isLoading.value) {
            return const Center(
              child: CarouselLoadingDesktop(),
            );
          } else {
            if (carouselController.carouselItemList.isNotEmpty) {
              return CarouselWithIndicatorDesktop(
                  data: carouselController.carouselItemList);
            } else {
              return const Center(
                  // child: Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: const [
                  //     Icon(Icons.hourglass_empty),
                  //     Text("Loading ...")
                  //   ],
                  // ),
                  );
            }
          }
        },
      ),
    );
  }
}
