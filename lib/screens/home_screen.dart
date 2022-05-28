import 'dart:convert';

import 'package:azkar1/models/category_model.dart';
import 'package:azkar1/screens/section_details_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();
  }

  IconData showIcon = Icons.list;
  String showStatus = "list";
  String screenName = "أذكار المسلم";

  // Icon showIcon1 = Icon(showIcon
  //   // Icons.apps_sharp,
  // );
  @override
  Widget build(BuildContext context) {
    // Icon showIcon1 = Icon(showIcon
    //   // Icons.apps_sharp,
    // );
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:
              // showIcon1,
              Icon(showIcon),
          onPressed: () {
            setState(() {
              if (showStatus == "list") {
                showIcon = Icons.apps_sharp;
                showStatus = "grid";
              } else {
                showIcon = Icons.list;
                showStatus = "list";
              }
            });
            print(screenName);
            // print(showIcon1);
          },
        ),
        title: Text('$screenName'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: showStatus == 'list'
            ? ListView.builder(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => buildCategory(
                  model: categories[index],
                ),
                itemCount: categories.length,
              )
            : GridView.builder(
                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                ),
                itemBuilder: (context, index) => buildCategory(
                  model: categories[index],
                ),
                itemCount: categories.length,
              ),
      ),
    );
  }

  Widget buildCategory({required CategoryModel model}) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(route)
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SectionDetailScreen(model: model,)));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xff5db7d4),
                // Color(0xFF36545e),
                Color(0xff4c8597)
              ]),
        ),
        width: double.infinity,
        margin: EdgeInsets.only(top: 12.0),
        padding: EdgeInsets.all(20.0),
        // height: 100,
        child: Center(
          child: Text(
            model.name!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Cairo',
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }

  /************ st load data from json *********/
  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database_json/categories_db.json")
        .then((data) {
      var response = json.decode(data);
      response.forEach((section) {
        CategoryModel _section = CategoryModel.fromJson(section);
        categories.add(_section);
      });
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
/************ nd load data from json *********/

}
