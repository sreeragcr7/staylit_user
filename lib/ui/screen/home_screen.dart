import 'package:flutter/material.dart';
import 'package:staylit/ui/screen/booking_screen.dart';
import 'package:staylit/ui/screen/dash_board_screen.dart';
import 'package:staylit/ui/screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _CarsoulScreenState();
}

class _CarsoulScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 1);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      bottomNavigationBar: Material(
        color: Color.fromARGB(255, 28, 74, 30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NavBarItem(
                icon: Icons.bookmark,
                label: 'Booking',
                onTap: () {
                  tabController!.animateTo(0);
                  setState(() {});
                },
                isSelected: tabController!.index == 0,
              ),
              NavBarItem(
                icon: Icons.home,
                label: 'Home',
                onTap: () {
                  tabController!.animateTo(1);
                  setState(() {});
                },
                isSelected: tabController!.index == 1,
              ),
              NavBarItem(
                icon: Icons.settings,
                label: 'Settings',
                onTap: () {
                  tabController!.animateTo(2);
                  setState(() {});
                },
                isSelected: tabController!.index == 2,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          BookingScreen(),
          DashBoardScreen(),
          SettingScreen(),
        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final Function() onTap;
  const NavBarItem({
    Key? key,
    required this.icon,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 30,
            color: isSelected ? Colors.white : Colors.white24,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            label,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  color: isSelected ? Colors.white : Colors.white60,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                ),
          ),
        ],
      ),
    );
  }
}
