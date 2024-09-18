import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:svg_icon/svg_icon.dart';
import 'package:yoliday_llp/constants/app_colors.dart';
import 'package:yoliday_llp/features/portfolio/portfolio.dart';
import 'package:yoliday_llp/features/input/input.dart';
import 'package:yoliday_llp/features/home/home.dart';
import 'package:yoliday_llp/features/profile/profile.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;

  Widget _getSelectedScreen() {
    switch (_selectedIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const PorfolioScreen();
      case 2:
        return const InputScreen();
      case 3:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }

  final List<BottomNavigationBarItem> _items=const [
    BottomNavigationBarItem(icon: SvgIcon('assets/icons/home.svg',height: 20,), label: 'Home'),
    BottomNavigationBarItem(icon: SvgIcon('assets/icons/portfolio.svg',height: 20,), label: 'Portfolio'),
    BottomNavigationBarItem(icon: SvgIcon('assets/icons/Input.svg',height: 20,), label: 'Input'),
    BottomNavigationBarItem(icon: SvgIcon('assets/icons/profile.svg',height: 20,), label: 'Profile')
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedScreen(),  // Display the selected page
      bottomNavigationBar:
       Stack(
         children: [
           BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index){
              setState(() {
                _selectedIndex=index;
              });
            },
            type: BottomNavigationBarType.fixed,
            items:_items,
            selectedItemColor:AppColors.orange,
          ),
          AnimatedPositioned(
            duration:const Duration(milliseconds:400),
            top: 0,
            left: _calculateIndicatorPosition(context),
            child: AnimatedContainer(
              duration:const Duration(milliseconds:400),
              height:3.h,
              width:  _calculateIndicatorWidth(context),
              curve: Curves.bounceOut,
              decoration: BoxDecoration(
                color: AppColors.orange,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
         ],
       ),
    );
  }

  // Calculate the width of the indicator based on the width of each nav item
  double _calculateIndicatorWidth(BuildContext context) {
    double totalWidth = ScreenUtil().screenWidth;
    int itemCount = _items.length;
    return totalWidth / itemCount;
  }

  // Calculate the position of the indicator based on the selected index
  double _calculateIndicatorPosition(BuildContext context) {
    double totalWidth = ScreenUtil().screenWidth;
    int itemCount = _items.length;
    double itemWidth = totalWidth / itemCount;
    return _selectedIndex * itemWidth;
  }
}