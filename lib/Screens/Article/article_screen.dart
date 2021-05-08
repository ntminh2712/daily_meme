import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class ArticleScreen extends StatefulWidget {
  final BuildContext menuScreenContext;

  ArticleScreen({Key key, this.menuScreenContext}) : super(key: key);

  @override
  _ArticleScreen createState() => _ArticleScreen();
}

class _ArticleScreen extends State<StatefulWidget> {
  List _items = [
    "123",
    "123123",
    "123",
    "123123",
    "123",
    "123123",
    "123",
    "123123"
  ];

  final TextEditingController _tfController = new TextEditingController();

  double _fontSize = 14;

  File _image;
  File _video;

  ImagePicker picker = ImagePicker();
  VideoPlayerController _videoPlayerController;

  // This funcion will helps you to pick and Image from Gallery
  _pickImageFromGallery() async {
    PickedFile pickedFile =
        await picker.getImage(source: ImageSource.gallery, imageQuality: 50);

    File image = File(pickedFile.path);

    setState(() {
      _image = image;
    });
  }

  // This funcion will helps you to pick a Video File
  _pickVideo() async {
    PickedFile pickedFile = await picker.getVideo(source: ImageSource.gallery);

    _video = File(pickedFile.path);

    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
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
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
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
              SizedBox(
                width: 10,
              ),
              Flexible(
                  child: Wrap(
                children: [
                  TextField(
                    controller: _tfController,
                    textInputAction: TextInputAction.done,
                    onSubmitted: (value) {
                      if (value.isEmpty) { return; }
                      setState(() {
                        _items.add(value);
                        _tfController.clear();
                      });
                    },
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
                        fontSize: 16,
                      ),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: "#meme_daily",
                    ),
                  ),

                ],
              )),
            ]),
            Container(
              height: 3,
              color: Colors.blueGrey.withAlpha(40),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Tags(
                  alignment: WrapAlignment.start,
                  runAlignment: WrapAlignment.start,
                    key: _tagStateKey,
                    itemCount: _items.length, // required
                    itemBuilder: (int index) {
                      final item = _items[index];
                      return ItemTags(
                        color: Colors.white,
                        textActiveColor: Color(
                          0xff376aed,
                        ),
                        textColor: Color(0xff376aed),
                        // Each ItemTags must contain a Key. Keys allow Flutter to
                        // uniquely identify widgets.
                        key: Key(index.toString()),
                        alignment: MainAxisAlignment.start,
                        index: index,
                        activeColor: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        // required
                        title: item,
                        icon: ItemTagsIcon(
                          icon: Icons.close,
                        ),
                        textStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Avenir",
                            color: Colors.blueGrey),
                        combine: ItemTagsCombine.withTextBefore,
                        // image: ItemTagsImage(
                        //     image: AssetImage(
                        //         "img.jpg") // OR NetworkImage("https://...image.png")
                        // ),
                        // OR null,
                        // icon: ItemTagsIcon(
                        //   icon: Icons.add,
                        // ),
                        // OR null,
                        // removeButton: ItemTagsRemoveButton(
                        //   icon: Icons.close,
                        //   backgroundColor: Color(
                        //     0xff0d253c,
                        //   ),
                        //   onRemoved: () {
                        //     // Remove the item from the data source.

                        //     //required
                        //     return true;
                        //   },
                        // ),
                        // OR null,
                        onPressed: (item) {
                          setState(() {
                            // required
                            _items.removeAt(index);
                          });
                        },
                        onLongPressed: (item) => print(item),
                      );
                    }),
              ],
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width,
      ),
    ));
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  final GlobalKey<TagsState> _tagStateKey = GlobalKey<TagsState>();

// Allows you to get a list of all the ItemTags
  _getAllItem() {
    List<Item> lst = _tagStateKey.currentState?.getAllItem;
    if (lst != null)
      lst.where((a) => a.active == true).forEach((a) => print(a.title));
  }
}
