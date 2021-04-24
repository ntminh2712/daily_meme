import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            /// image content of "outline"
            Image.network(
              "bridged://url-reservation/image-hosting/1:1060",
              width: 68,
              height: 68,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "Jasmine",
              style: TextStyle(
                color: Color(
                  0xff2d4379,
                ),
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontFamily: "Avenir",
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
      )
    );
  }
}
