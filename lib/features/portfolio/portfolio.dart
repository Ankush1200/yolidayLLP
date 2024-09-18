
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:yoliday_llp/constants/app_colors.dart';
import 'package:yoliday_llp/features/portfolio/widget/custom_list.dart';

class PorfolioScreen extends StatelessWidget {
  const PorfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:AppColors.white,
          title: const Text("Portfolio",style: TextStyle(fontWeight: FontWeight.w500),),
          actions: [
            const SvgIcon('assets/icons/shopping_bag.svg'),
            SizedBox(width: 15.w,),
            const SvgIcon('assets/icons/notifications.svg'),
            SizedBox(width: 20.w,),
          ],
          bottom:const TabBar(
            labelPadding: EdgeInsets.zero,
            indicatorWeight: 3, 
            labelColor:  AppColors.orange,
            indicatorColor: AppColors.orange,
            unselectedLabelColor: AppColors.black,
            labelStyle: TextStyle(fontWeight: FontWeight.w500),
            tabs: [
              Tab(text: "Project"),
              Tab(text: "Saved"),
              Tab(text: "Shared"),
              Tab(text: "Achievment"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            CustomList(),
            Center(child: Text('Empty')),
            Center(child: Text('Empty')),
            Center(child: Text('Empty')),
          ],
        ),
      ),
    );
  }
}
