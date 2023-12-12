import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
   AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: const Color.fromARGB(100, 22, 44, 33),
      backgroundColor:Color.fromARGB(255, 0, 0, 0).withOpacity(0.6),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
         const DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 40,
                  // backgroundImage: NetworkImage(
                  //     FirebaseAuth.instance.currentUser!.photoURL!),
                ),
                const SizedBox(height: 10),
                // Text(
                //   FirebaseAuth.instance.currentUser!.displayName!,
                //   style: const TextStyle(
                //     color: Colors.white,
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                const SizedBox(height: 5),
                // Text(
                  // '${FirebaseAuth.instance.currentUser!.email}',
                  // style: const TextStyle(
                  //   color: Colors.white,
                  //   fontSize: 14,
                  // ),
                // ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
            ),
            title: const Text('Home', style: TextStyle(color: Colors.white)),
       trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios))
          ),SizedBox(height: 10,),
            ListTile(
            leading: Icon(
              Icons.search,
            ),
            title: const Text('search', style: TextStyle(color: Colors.white)),
       trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios))
          ),SizedBox(height: 10,),   
          ListTile(
            leading:const Icon(
              Icons.logout,
              // color: white,
            ),
            title: const Text('Logout', style: TextStyle(color: Colors.white)),
            trailing: IconButton(onPressed: (){}, icon:const Icon(Icons.arrow_forward_ios))
          ),
        ],
      ),
    );
  }
}

