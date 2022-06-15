import 'package:flutter/material.dart';
import 'package:flutter_input_widgets/constants/icon_constants.dart';
import 'package:flutter_input_widgets/screen/page_one.dart';
import 'package:flutter_input_widgets/screen/page_three.dart';
import 'package:flutter_input_widgets/screen/page_two.dart';

class TabbarTabbarViewKullanimi extends StatefulWidget {
  const TabbarTabbarViewKullanimi({Key? key}) : super(key: key);

  @override
  State<TabbarTabbarViewKullanimi> createState() =>
      _TabbarTabbarViewKullanimiState();
}

class _TabbarTabbarViewKullanimiState extends State<TabbarTabbarViewKullanimi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tabbar & TabbarView Kullanimi'),
          bottom: TabBar(
            indicatorColor: Colors.amber.shade200,
            labelColor: Colors.white,
            indicatorWeight: 2,
            unselectedLabelColor: Colors.black,
            tabs: [
              Tab(
                icon: IconConstants.tabbarIconOne,
                text: IconConstants.tabbarIconOneText,
              ),
              Tab(
                icon: IconConstants.tabbarIconTwo,
                text: IconConstants.tabbarIconTwoText,
              ),
              Tab(
                icon: IconConstants.tabbarIconThree,
                text: IconConstants.tabbarIconThreeText,
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            PageFour(),
            PageTwo(),
            PageThree(),
          ],
        ),
      ),
    );
  }
}
