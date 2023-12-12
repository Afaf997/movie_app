import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:movie_app/apps/controller/bottomNavigation.dart';
import 'package:movie_app/apps/views/Homescreen.dart';
import 'package:movie_app/apps/views/favorites.dart';
import 'package:movie_app/apps/views/new_screen.dart';
import 'package:movie_app/apps/views/news_details.dart';


class BottomNavigation extends StatelessWidget {
  final NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return BottomNavigationBar(
          currentIndex: navigationController.currentIndex.value,
          onTap: (index) {
            navigationController.setIndex(index);
            _handleNavigation(index);
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.movie, color: Colors.white),
              label: 'News',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.white),
              label: 'Favorites',
            ),
          ],
        );
      },
    );
  }

  void _handleNavigation(int index) {
    switch (index) {
      case 0:
        Get.to(() =>  HomeScreen());
        break;
      case 1:
        Get.to(() => NewsHomeScreen());
        break;
      case 2:
        Get.to(() =>  WishlistPage());
        break;
      default:
        break;
    }
  }
}
