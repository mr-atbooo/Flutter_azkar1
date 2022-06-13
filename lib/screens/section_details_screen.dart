import 'dart:convert';

import 'package:azkar1/models/category_details_model.dart';
import 'package:azkar1/models/category_model.dart';
import 'package:azkar1/screens/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionDetailScreen extends StatefulWidget {
  final CategoryModel model;
  const SectionDetailScreen({Key? key, required this.model}) : super(key: key);

  @override
  State<SectionDetailScreen> createState() => _SectionDetailScreenState();
}

class _SectionDetailScreenState extends State<SectionDetailScreen> {
  List<CategoryDetailModel> azkar = [];
  int allazkarCount = 0;
  int azkarCount = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadSections();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: Text('${widget.model.name}'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => buildZker(
          model: azkar[index],
        ),
        itemCount: azkar.length,
      ),
    );
  }

  Widget buildZker({required CategoryDetailModel model}) {
    int count = model.count!;
    var zker = {
      "id": model.id,
      "category_id": model.categoryId,
      "count": model.count! - 1,
      "description": model.description,
      "reference": model.reference,
      "content": model.content,
    };
    CategoryDetailModel _zker = CategoryDetailModel.fromJson(zker);

      return GestureDetector(
        onTap: () {
          // azkar.firstWhere((element) => element.id == model.id)=zker
          // azkar.firstWhere((element) => element.id == searchedId) = food;
          //we are here update zker data with new count number
          azkar[azkar.indexWhere((element) => element.id == model.id)] = _zker;
          // azkar[azkar.indexWhere((element) => element.id == model.id)] = zker;
          // count--;
          setState(() {
            count--;
            azkarCount ++;
            if(count < 1){
              // azkar.indexWhere((element) => element.id == model.id)
              // azkar.remove(model.id);
              azkar.removeWhere((item) => item.id == model.id);
              print(" zkar moved ${model}");
            }
            if(azkarCount == allazkarCount){

              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryScreen()));
            }
          });
          // print("${model.count}");
          // print("----------------");
          // print("$count");
          print("finished azkar count => ${azkarCount}");
          print(" azkar length => ${azkar.length}");
          // print("---------------");
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Color(0xff5db7d4),
                    Color(0xff4c8597),
                    Color(0xff4c8597),
                    // Color(0xff4c8666)
                  ]),
            ),
            child: Column(children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black26,
                      width: 1,
                    )),
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                  bottom: 10,
                ),
                child:
                Text(
                  '${model.content}',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "التكرار",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${model.count == '' ? 1 : model.count}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ]),
          ),
        ),
      );

  }
  Widget buildZkerTest({required CategoryDetailModel model}) {
    int count = model.count!;
    var zker = {
      "id": model.id,
      "category_id": model.categoryId,
      "count": model.count! - 1,
      "description": model.description,
      "reference": model.reference,
      "content": model.content,
    };
    CategoryDetailModel _zker = CategoryDetailModel.fromJson(zker);
    if(model.count! > 0) {
      return GestureDetector(
        onTap: () {
          // azkar.firstWhere((element) => element.id == model.id)=zker
          // azkar.firstWhere((element) => element.id == searchedId) = food;
          //we are here update zker data with new count number
          azkar[azkar.indexWhere((element) => element.id == model.id)] = _zker;
          // azkar[azkar.indexWhere((element) => element.id == model.id)] = zker;
          // count--;
          setState(() {
            count--;
            azkarCount ++;
            if(azkarCount == allazkarCount){
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => CategoryScreen()));
            }
          });
          // print("${model.count}");
          // print("----------------");
          // print("$count");
          print("finished azkar count => ${azkarCount}");
          print(" azkar length => ${azkar.length}");
          // print("---------------");
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    // Color(0xff5db7d4),
                    Color(0xff4c8597),
                    Color(0xff4c8597),
                    // Color(0xff4c8666)
                  ]),
            ),
            child: Column(children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black26,
                      width: 1,
                    )),
                padding: EdgeInsets.only(
                  top: 10,
                  right: 10,
                  left: 10,
                  bottom: 10,
                ),
                child:
                Text(
                  '${model.content}',
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  child: Row(
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "التكرار",
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${model.count == '' ? 1 : model.count}',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ]),
          ),
        ),
      );
    }else{
      return SizedBox();
    }
  }
  /************ st load data from json *********/
  loadSections() async {
    DefaultAssetBundle.of(context)
        .loadString("assets/database_json/category_details_db.json")
        .then((data) {
      var response = json.decode(data);
      print(response);
      response.forEach((section) {
        CategoryDetailModel _section = CategoryDetailModel.fromJson(section);
        if(widget.model.id == _section.categoryId){
          azkar.add(_section);
          allazkarCount+= _section.count!;
        }

      });
      print("all azkar count => ${allazkarCount}");
      setState(() {});
    }).catchError((error) {
      print(error);
    });
  }
/************ nd load data from json *********/
}


