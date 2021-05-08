import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class SearchScreen extends StatelessWidget {

  File _image;
  File _video;

  ImagePicker picker = ImagePicker();
  VideoPlayerController _videoPlayerController;

  // This funcion will helps you to pick and Image from Gallery
  _pickImageFromGallery() async {
    PickedFile pickedFile =
    await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    File image = File(pickedFile.path);

    // setState(() {
    //   _image = image;
    // });
  }

  // This funcion will helps you to pick a Video File
  _pickVideo() async {
    PickedFile pickedFile =
    await picker.getVideo(source: ImageSource.gallery);

    _video = File(pickedFile.path);

    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        // setState(() {});
        _videoPlayerController.play();
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            // mainAxisSize: MainAxisSize.,
            children: [
              Row(
                children: [
                  Text(
                    "Bài viết mới",
                    style: TextStyle(
                      color: Color(
                        0xff0d253c,
                      ),
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Avenir",
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.4), width: 1.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/default-avatar.jpg",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Ảnh",
                            style: TextStyle(
                              color: Color(
                                0xff0d253c,
                              ),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Avenir",
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  GestureDetector(
                    onTap: () {
                      _pickVideo();
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.4), width: 1.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/default-avatar.jpg",
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Video",
                            style: TextStyle(
                              color: Color(
                                0xff0d253c,
                              ),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Avenir",
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Tiêu đề bài viết",
                          style: TextStyle(
                            color: Color(
                              0xff0d253c,
                            ),
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Avenir",
                          ),
                        ),
                        Container(
                          height: 10,
                        )
                      ],
                    ),
                    Container(
                      height: 3,
                      color: Colors.blueGrey.withAlpha(40),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  TextFormField(
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Avenir",
                    ),
                    cursorColor: Colors.black,
                    decoration: new InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.blueGrey,
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "Cho bài viết của bạn 1 tiêu đề",
                    ),
                  ),
                  Container(
                    height: 2,
                    color: Colors.blueGrey.withAlpha(40),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  SizedBox(
                    child: Text(
                      "Add Tags:",
                      style: TextStyle(
                        color: Color(
                          0xff376aed,
                        ),
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                        fontFamily: "Avenir",
                        letterSpacing: 0.75,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(5.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(22)),
                    child: Row(
                      children: [
                        Text(
                          "MEME DAILY",
                          style: TextStyle(
                            color: Color(
                              0xff376aed,
                            ),
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            fontFamily: "Avenir",
                            letterSpacing: 0.75,
                          ),
                        ),
                        // SizedBox(
                        //   width: 8,
                        // ),
                        GestureDetector(
                            onTap: () {
                              print("Remvoe");
                            },
                            child: Icon(
                                Icons.close,
                                color: Color(0xff376aed
                                )
                            )
                        ),
                      ],
                    ),
                  ),
                ],
              )
              // Row(
              //   children: List.generate(50~/1, (index) => Expanded(
              //     child: Container(
              //       color: index%2==0?Colors.transparent
              //           :Colors.grey,
              //       height: 2,
              //     ),
              //   )),
              // ),
            ],
          ),
          width: MediaQuery
              .of(context)
              .size
              .width,
        ));
  }
}
