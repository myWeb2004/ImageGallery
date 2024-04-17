import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:imagegallery/Model/Image_model.dart';

import 'Controller/HomeController.dart';

class HomePage extends StatelessWidget {
  var controller = Get.put(homeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            color: Colors.white24,
            image: DecorationImage(
                image: Image.network(
                        'https://images.pexels.com/photos/1261728/pexels-photo-1261728.jpeg?auto=compress&cs=tinysrgb&w=400')
                    .image,
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Image Gallery',
                      textStyle: const TextStyle(
                        fontSize: 25.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      speed: const Duration(milliseconds: 200),
                    ),
                  ],
                  totalRepeatCount: 1,
                  pause: const Duration(milliseconds: 100),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.sizeOf(context).height * 0.20,
                  width: MediaQuery.sizeOf(context).width * 0.50,
                  decoration: BoxDecoration(color: Colors.white24),
                  child: SizedBox(
                    child: Center(
                      child: Text(
                        "The tree which moves some to tears of joy is in the eyes of others only a green thing which stands in the way. Some see nature all ridicule and deformity, and by these I shall not regulate my propositions. And some see no nature at all. But to the eyes of the man of imagination, nature is imagination itself. –William Blake",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
                height: MediaQuery.sizeOf(context).height * 0.70,
                width: MediaQuery.sizeOf(context).width,
                child: Obx(() {
                  if (controller.isloading.isTrue) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return MasonryGridView.builder(
                      itemCount: controller.hits.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ImageModel(
                            controller.hits[index].largeImageURL!,
                            controller.hits[index].likes!,
                            controller.hits[index].downloads!,
                            controller.hits[index].views!,
                            controller.hits[index].tags!);
                      },
                      gridDelegate:
                          SliverSimpleGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                    );
                  }
                })),
          ],
        ),
      ),
    );
  }
}
