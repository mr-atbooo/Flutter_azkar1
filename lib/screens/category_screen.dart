import 'dart:convert';

import 'package:azkar1/models/category_model.dart';
import 'package:azkar1/screens/section_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
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
  bool statusBar = false;
  String statusBarText = '';
  String statusBarType = '';
  int saveHeight = 120;

  // Icon showIcon1 = Icon(showIcon
  //   // Icons.apps_sharp,
  // );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              setState(() {
                // categories.clear();
                openSittingBox();
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
            print(showStatus);
            // print(showIcon1);
          },
        ),
        title: Text('$screenName'),
      ),
      body: Column(children: [
        statusBar
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    statusBar = false;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    '${statusBarText}',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                  color: Colors.grey,
                  width: double.infinity,
                ),
              )
            : SizedBox(),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: showStatus == 'list'
              ? Container(
                  height: statusBar
                      ? MediaQuery.of(context).size.height - 200
                      : MediaQuery.of(context).size.height - saveHeight,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildListCategory(
                      model: categories[index],
                    ),
                    itemCount: categories.length,
                  ),
                )
              : Container(
                  height: MediaQuery.of(context).size.height - saveHeight,
                  child: GridView.builder(
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
        ),
      ]),
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

  Widget buildListCategory({required CategoryModel model}) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(route)
        if (statusBar) {
          if (statusBarType == "edit") {
            openEditModal(model);
          } else {
            print('delete modal');
            setState(() {
              categories.remove(model);
            });
          }
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SectionDetailScreen(
                    model: model,
                  )));
        }
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

  /************* st modal for Sitting *******************/
  openSittingBox() {
    double borderRadius = 15.0;
    statusBar = false;
    statusBarType = '';
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
                  sittingIcon(
                      title: 'أضافة ذكر',
                      itemIcon: Icons.add,
                      myFunc: () {
                        print('add');
                        Navigator.pop(context, false);
                        addModal();
                      }),
                  sittingIcon(
                      title: 'تعديل ذكر',
                      itemIcon: Icons.edit,
                      myFunc: () {
                        print('edit');
                        setState(() {
                          statusBar = !statusBar;
                          statusBarType = "edit";
                          statusBarText = "أضغط على الذكر لتعديله أو الضغط هنا للألغاء";
                          Navigator.pop(context, false);
                        });
                      }),
                  sittingIcon(
                      title: 'حذف ذكر',
                      itemIcon: Icons.delete,
                      myFunc: () {
                        print('delete');
                        setState(() {
                          // if(statusBar == false){
                          statusBar = !statusBar;
                          // }else{}

                          statusBarType = "delete";
                          statusBarText = "أضغط على الذكر لحذفه أو الضغط هنا للألغاء";
                        });
                        Navigator.pop(context, false);
                      }),
                ],
              ),
            ),
          );
        });
  }

  /************* nd modal for Sitting *******************/
  /************* st modal for add element *******************/
  addModal() {
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
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      // print(111);
                      categories.add(
                          CategoryModel(categories.length, myController.text));
                      setState(() {});
                      Navigator.pop(context, false); // passing false
                      myController.clear();
                      Fluttertoast.showToast(
                          msg: "تمت العمليه بنجاح",
                          // toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
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
  /************* st modal for edit element *******************/
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
                        Text(
                          "تعديل ذكر / دعاء",
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
                        "تعديل ذكر",
                        style: TextStyle(color: Colors.white, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    onTap: () {
                      // print(111);
                      final category = categories
                          .firstWhere((item) => item.id == myModal.id);
                      setState(() => category.name = editText.text);
                      // categories.add(CategoryModel(categories.length, editText.text));
                      setState(() {});
                      Navigator.pop(context, false); // passing false
                      myController.clear();
                      Fluttertoast.showToast(
                          msg: "تمت العمليه بنجاح",
                          // toastLength: Toast.LENGTH_LONG,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      // _controller.clear();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  /************* nd modal for edit element *******************/
  /************* st Widget for element sitting modal  *******************/
  Widget sittingIcon({String? title, IconData? itemIcon, Function? myFunc}) {
    return Column(
      children: [
        ListTile(
          title: Text(
            title!,
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 20.0),
          ),
          trailing: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: mainColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              itemIcon!,
              color: Colors.white,
              size: 20.0,
            ),
          ),
          onTap: () => myFunc!(),
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.black12,
        ),
      ],
    );
  }
/************* st Widget for element sitting modal  *******************/

}
