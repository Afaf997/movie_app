// import 'package:flutter/material.dart';
// import 'package:movie_app/moviesDocument/controller/bottomNavigation.dart';
// import 'package:movie_app/moviesDocument/views/Homescreen.dart';
// import 'package:movie_app/moviesDocument/views/favorites.dart';
// import 'package:provider/provider.dart';

// class BottomNavigation extends StatelessWidget {
//   const BottomNavigation({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Consumer<NavigationProvider>(
//         builder: (context, navigationProvider, _) {
//           return BottomNavigationBar(
//             currentIndex: navigationProvider.currentIndex,
//             onTap: (index) {
//               Provider.of<NavigationProvider>(context, listen: false).setIndex(index);
//                _handleNavigation(context, index);
//             },
//             items:const [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.home,color: Colors.white,),
//                 label: 'Home',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.movie,color: Colors.white,),
//                 label: 'News',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.favorite,color: Colors.white,),
//                 label: 'Favorites',
//               ),
//             ],
//           );    },
//       );
//   }
//   void _handleNavigation(BuildContext context, int index) {
//   switch (index) {
//     case 0:
//       Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
//       break;
//     case 1:
//       // Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoriesPage()));
//       break;
//     case 2:
//       Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritePage()));
//       break;
//     case 3:
//       // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
//       break;
//     default:
//       break;
//   }
// }
  
// }

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:movie_app/moviesDocument/controller/bottomNavigation.dart';
import 'package:movie_app/moviesDocument/views/Homescreen.dart';
import 'package:movie_app/moviesDocument/views/favorites.dart';

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
        Get.to(() => const HomeScreen());
        break;
      case 1:
        // Get.to(() => CategoriesPage());
        break;
      case 2:
        Get.to(() => const FavoritePage());
        break;
      case 3:
        // Get.to(() => ProfilePage());
        break;
      default:
        break;
    }
  }
}
