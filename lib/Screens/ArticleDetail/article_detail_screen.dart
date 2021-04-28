import 'package:daily_meme/common/data/home_source.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  final HomeItem articleDetail;

  const ArticleDetailScreen({Key key, this.articleDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width - 60,
                          ),
                          child: Text(
                            articleDetail.excerpt,
                            style: TextStyle(
                              color: Color(
                                0xff0d253c,
                              ),
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Avenir",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "Richard Gervain",
                                  style: TextStyle(
                                    color: Color(
                                      0xff2d4379,
                                    ),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Avenir",
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  width: 38,
                                  height: 38,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://s3.amazonaws.com/pixpa.com/com/articles/1526992650-934985-shutterstock-709358158jpg.png",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  "2m ago",
                                  style: TextStyle(
                                    color: Color(
                                      0xff7b8bb2,
                                    ),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Avenir",
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        width: 155,
                        height: 39,
                      ),
                      Container(
                        width: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              "assets/images/default-avatar.jpg",
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                            ),
                            Image.network(
                              "https://s3.amazonaws.com/pixpa.com/com/articles/1526992650-934985-shutterstock-709358158jpg.png",
                              width: 24,
                              height: 24,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  width: width,
                  child: Image.network(
                    articleDetail.imageUrl,
                    width: width,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      child: ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: width - 10,
                          ),
                          child: Wrap(
                              runSpacing: 5.0,
                              spacing: 5.0,
                              children: articleDetail.tags
                                  .take(10)
                                  .map<Widget>((String tag) {
                                final Color color = articleDetail
                                    .tagColors[articleDetail.tags.indexOf(tag)];
                                return Container(
                                  padding: const EdgeInsets.all(3.0),
                                  decoration: BoxDecoration(
                                    color: color,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.4),
                                        width: 1.0),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5.0),
                                    ),
                                  ),
                                  child: Text(
                                    tag,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: color.computeLuminance() < 0.5
                                            ? Colors.white
                                            : Colors.black),
                                  ),
                                );
                              }).toList())),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: width - 25,
                        ),
                        child: Text(
                          articleDetail.content,
                          style: TextStyle(
                            color: Color(
                              0xff0d253c,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w100,
                            fontFamily: "Avenir",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 100,
            )
          ],
        ),
        width: MediaQuery.of(context).size.width,
      ),
    ));
  }
}
