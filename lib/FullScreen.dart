import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FullScreen extends StatelessWidget {
  String tags;
  String ImageUrl;

  FullScreen(this.ImageUrl, this.tags);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$tags"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Container(
              child: Stack(
            alignment: Alignment.centerRight,
            children: [
              ImageUrl != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image(image: Image.network(ImageUrl).image))
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          )),
        ),
      ),
    );
  }
}
