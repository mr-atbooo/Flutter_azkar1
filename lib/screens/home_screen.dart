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
  Color myColor = Color(0xff00bfa5);
  Color mainColor = Color(0xff4c8597);
  final myController = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            // onPressed: () {
            //   setState(() {
            //     print('add');
            //     // categories.add(CategoryModel(categories.length, 'ss'));
            //     // print(categories);
            //     // showDialog(
            //     //     context: context,
            //     //     builder: (_) => AlertDialog(
            //     //       title: Text('Dialog Title'),
            //     //       content: Text('This is my content'),
            //     //     )
            //     // );
            //     // Future.delayed(Duration.zero, () => showAddModal(context));
            //     // showAddModal(context);
            //   });
            // },
            onPressed: openAlertBox,
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                categories.clear();
              });
            },
          ),
        ],
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
                itemBuilder: (context, index) => buildAnimatedCategory(
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
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SectionDetailScreen(
                  model: model,
                )));
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
                mainColor
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

  Widget buildAnimatedCategory({required CategoryModel model}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff5db7d4),
              // Color(0xFF36545e),
              mainColor
            ]),
      ),
      width: double.infinity,
      margin: EdgeInsets.only(top: 12.0),
      padding: EdgeInsets.all(20.0),
      // height: 100,
      child: ListTile(
        title: Text(
          model.name!,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Cairo',
            fontSize: 20.0,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.white),
          onPressed: () {
            setState(() {
              categories.remove(model);
            });
          },
        ),
        leading: IconButton(
          icon: const Icon(Icons.edit, color: Colors.white),
          // onPressed: () {
          //   setState(() {
          //     categories.remove(model);
          //   });
          // },
          onPressed: (){
            openEditModal(model);
          },
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

  // void showAddModal(BuildContext context) {
  //   showDialog(
  //       useSafeArea: false,
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             contentPadding: const EdgeInsets.all(0),
  //
  //             // title: Text('Dialog Title'),
  //             content: Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(20.0),
  //                 color: Colors.green,
  //               ),
  //               width: MediaQuery.of(context).size.width,
  //               height: 300,
  //             ),
  //           ));
  // }

  /************* st modal for add element *******************/
  openAlertBox() {
    double borderRadius = 15.0;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            // contentPadding: EdgeInsets.only(top: 10.0),
            contentPadding: const EdgeInsets.all(0),
            content: Container(
              // width: 300.0,
              // height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    // color: mainColor,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(borderRadius),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0),
                      ),
                      color: mainColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          "إضافة ذكر / دعاء",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(width: 15),
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.orange,
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: mainColor,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      controller: myController,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "أكتب النص هنا",
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                    ),
                  ),
                  // SizedBox(
                  //   height: 30.0,
                  // ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius),
                            bottomRight: Radius.circular(borderRadius)),
                      ),
                      child: Text(
                        "أضف ذكر",
                        style: TextStyle(color: Colors.white,fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: (){
                      // print(111);
                      categories.add(CategoryModel(categories.length, myController.text));
                      setState(() {});
                      Navigator.pop(context, false); // passing false
                      myController.clear();
                      // _controller.clear();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  /************* nd modal for add element *******************/
 /************* st modal for add element *******************/
  openEditModal(CategoryModel myModal) {
    double borderRadius = 15.0;
    TextEditingController editText = TextEditingController();
    editText.text = myModal.name!;
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(borderRadius),
              ),
            ),
            // contentPadding: EdgeInsets.only(top: 10.0),
            contentPadding: const EdgeInsets.all(0),
            content: Container(
              // width: 300.0,
              // height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    // color: mainColor,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      // borderRadius: BorderRadius.circular(borderRadius),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(15.0),
                        topRight: const Radius.circular(15.0),
                      ),
                      color: mainColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("تعديل ذكر / دعاء",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                        ),
                        SizedBox(width: 15),
                        Container(
                          decoration: BoxDecoration(
                            // color: Colors.orange,
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.add,
                            color: mainColor,
                            size: 25.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 30.0, right: 30.0),
                    child: TextField(
                      controller: editText,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "أكتب النص هنا",
                        border: InputBorder.none,
                      ),
                      maxLines: 8,
                    ),
                  ),
                  // SizedBox(
                  //   height: 30.0,
                  // ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(borderRadius),
                            bottomRight: Radius.circular(borderRadius)),
                      ),
                      child: Text(
                        "أضف ذكر",
                        style: TextStyle(color: Colors.white,fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: (){
                      // print(111);
                      final category = categories.firstWhere((item) => item.id == myModal.id);
                      setState(() => category.name = editText.text);
                      // categories.add(CategoryModel(categories.length, editText.text));
                      setState(() {});
                      Navigator.pop(context, false); // passing false
                      myController.clear();
                      // _controller.clear();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
  /************* nd modal for add element *******************/

}
