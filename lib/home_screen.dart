import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_easy_http_api/api/api_call.dart';
import 'package:flutter_easy_http_api/api/api_const.dart';
import 'package:flutter_easy_http_api/model/category_list_response.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CategoryListResponse categoryListResponse;
  List<Result> categoryList = [];

  @override
  void initState() {
    // TODO: implement initState
    APICall().getCategoryList().then((response) {
      if (response.statusCode == 200) {
        categoryListResponse =
            CategoryListResponse.fromJson(json.decode(response.body));
        setState(() {
          categoryList = categoryListResponse.result!;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 6,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20, bottom: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    children: [
                      Image.network(
                        APIConst.imageUrl + categoryList[index].url.toString(),
                        height: 40,
                        width: 40,
                        color: Colors.redAccent,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        categoryList[index].categoryName.toString(),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
