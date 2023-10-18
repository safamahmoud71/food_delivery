
import 'package:flutter/material.dart';

import 'package:food_delivery/utils/size_config.dart';

import 'weidgts/custom_app_bar.dart';
import 'weidgts/home_page_view.dart';


class MainFoodPage extends StatefulWidget {
  const MainFoodPage({super.key});

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.horizontalBlock*20),
          child:  const Column(
            children: [
              CustomAppBar(),//appbar section
              PageViewSection(),

            ],
          ),
        ),
      ),
    );
  }
}




