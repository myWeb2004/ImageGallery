import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:imagegallery/Controller/HomeController.dart';
import 'package:imagegallery/FullScreen.dart';

class ImageModel extends StatelessWidget {
  String ImageUrl;
  int Likes;
  int Downloads;
  int views;
  String tags;

  ImageModel(this.ImageUrl, this.Likes, this.Downloads, this.views, this.tags);

  @override
  Widget build(BuildContext context) {
    var visible = false.obs;
    return ImageUrl.isEmpty
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Stack(
                  // alignment: Alignment.centerRight,
                  children: [
                    ImageUrl != null
                        ? GestureDetector(
                            onTap: () {
                              Get.to(FullScreen(ImageUrl, tags));
                            },
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image(
                                    image: Image.network(ImageUrl).image)))
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.heart_broken,
                                  color: Colors.white,
                                ),
                                Text(
                                  "$Likes",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.download_for_offline,
                                  color: Colors.white,
                                ),
                                Text(
                                  "$Downloads",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Icon(
                                  Icons.remove_red_eye,
                                  color: Colors.white,
                                ),
                                Text(
                                  "$views",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "$tags",
                            style: TextStyle(color: Colors.white),
                          )),
                    )
                  ],
                )),
          );
  }
}
