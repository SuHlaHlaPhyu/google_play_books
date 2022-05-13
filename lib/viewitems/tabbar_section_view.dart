import 'package:flutter/material.dart';

class TabBarSectionView extends StatelessWidget {

  final TabController? tabController;
  final String tabBarOneName;
  final String tabBarTwoName;
  TabBarSectionView({
    required this.tabController,
    required this.tabBarOneName,
    required this.tabBarTwoName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.label,
        indicatorColor: Colors.blue,
        controller: tabController,
        labelColor: Colors.blue,
        labelStyle: const TextStyle(
          color: Colors.blue,
        ),
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(
            child: Text(
              tabBarOneName,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Tab(
            child: Text(
              tabBarTwoName,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
              key: const ValueKey("shelves"),
            ),
          ),
        ],
      ),
    );
  }
}
