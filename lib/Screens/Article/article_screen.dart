import 'package:daily_meme/components/rounded_input_field.dart';
import 'package:flutter/material.dart';

class ArticleScreen extends StatelessWidget {

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
                    Container(
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
                    SizedBox(width: 15),

                    Container(
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
                            "Git",
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
                    )
                  ],
                ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
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
              ),

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
                    color: Colors.black,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Tiêu đề bài viết",

                ),
              ),
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
        )
    );
  }
}
