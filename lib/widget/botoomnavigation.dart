import 'package:flutter/material.dart';
import 'package:movie_app/controller/bottomnavigation.dart';
import 'package:movie_app/views/favorites.dart';
import 'package:movie_app/views/homescreen.dart';
import 'package:provider/provider.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return  Consumer<NavigationProvider>(
        builder: (context, navigationProvider, _) {
          return BottomNavigationBar(
            currentIndex: navigationProvider.currentIndex,
            onTap: (index) {
              Provider.of<NavigationProvider>(context, listen: false).setIndex(index);
               _handleNavigation(context, index);
            },
            items:const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home,color: Colors.white,),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category,color: Colors.white,),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite,color: Colors.white,),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,color: Colors.white,),
                label: 'Profile',
              ),
            ],
          );    },
      );
  }
  void _handleNavigation(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
      break;
    case 1:
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const CategoriesPage()));
      break;
    case 2:
      Navigator.push(context, MaterialPageRoute(builder: (context) => const FavoritePage()));
      break;
    case 3:
      // Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
      break;
    default:
      break;
  }
}
  
}
