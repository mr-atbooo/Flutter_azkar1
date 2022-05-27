import 'package:azkar1/screens/section_details_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

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
              if(showStatus == "list")
              {
                showIcon = Icons.apps_sharp;
                showStatus = "grid";
              }
              else{
                showIcon = Icons.list;
                showStatus = "list";
              }
            });
            print(screenName);
            // print(showIcon1);
          },
        ),
        title:  Text('$screenName'),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: showStatus =='list'? ListView(physics: BouncingScrollPhysics(), children: [
          buildCategory(title: 'azkar 1'),
          buildCategory(title: 'azkar 2'),
          buildCategory(title: 'azkar 3'),
          buildCategory(title: 'azkar 4'),
          buildCategory(title: 'azkar 5'),
          buildCategory(title: 'azkar 6'),
          buildCategory(title: 'azkar 7'),
          buildCategory(title: 'azkar 8'),
          buildCategory(title: 'azkar 9'),
          buildCategory(title: 'azkar 10'),
        ]):GridView(
          physics: BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: 10.0),
          children: <Widget>[
            buildCategory(title: 'azkar 1'),
            buildCategory(title: 'azkar 2'),
            buildCategory(title: 'azkar 3'),
            buildCategory(title: 'azkar 4'),
            buildCategory(title: 'azkar 5'),
            buildCategory(title: 'azkar 6'),
            buildCategory(title: 'azkar 7'),
            buildCategory(title: 'azkar 8'),
            buildCategory(title: 'azkar 9'),
            buildCategory(title: 'azkar 10'),
          ],
        ),
      ),
    );
  }

  Widget buildCategory({required String title}) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(route)
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => SectionDetailScreen()));
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
        child:
        Center(
          child: Text(
            title,
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
}
