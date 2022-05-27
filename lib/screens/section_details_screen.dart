import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SectionDetailScreen extends StatelessWidget {
  const SectionDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: Text('الاذكار'),
      ),
      body: ListView(
        children: [
          buildZker(),
          buildZker(),
        ],
      ),
    );
  }
}

class buildZker extends StatelessWidget {
  const buildZker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('zekr');
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
              child: Text(
                "أَعُوذُ بِاللهِ مِنْ الشَّيْطَانِ الرَّجِيمِ\nاللّهُ لاَ إِلَـهَ إِلاَّ هُوَ الْحَيُّ الْقَيُّومُ لاَ تَأْخُذُهُ سِنَةٌ وَلاَ نَوْمٌ لَّهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الأَرْضِ مَن ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلاَّ بِإِذْنِهِ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ وَلاَ يُحِيطُونَ بِشَيْءٍ مِّنْ عِلْمِهِ إِلاَّ بِمَا شَاء وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالأَرْضَ وَلاَ يَؤُودُهُ حِفْظُهُمَا وَهُوَ الْعَلِيُّ الْعَظِيمُ.\n[آية الكرسى - البقرة 255].",
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
                          "10",
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
}
