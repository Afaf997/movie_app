import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/apps/services/dio_Service.dart';
import 'package:movie_app/apps/widget/search_list.dart';
import 'package:movie_app/utils/consts.dart';
import 'package:unicons/unicons.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  bool isLoading = true;
  final ScrollController _scrollController = ScrollController();
  final myController = TextEditingController();
  String storageQuery= "";

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: background_primary,
        extendBody: true,
        body: Stack(
          alignment: AlignmentDirectional.topStart,
          children: [
            // Image.asset(
            //   'assets/backdrop.png',
            //   fit: BoxFit.fitWidth,
            //   width: size.width,
            // ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    margin: const EdgeInsets.fromLTRB(8, 28, 8, 0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: accent_t.withOpacity(0.95),
                    ),
                    child: TextField(
                      controller: myController,
                      cursorColor: accent_secondary,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          UniconsLine.search,
                          color: Colors.white,
                        ),
                        prefixIconColor: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                         storageQuery= myController.text;
                        });
                      },
                    ),
                  ),
                  SearchList(
                      future: ApiCall().getSearchResult( storageQuery),
                      scrollController: _scrollController),
                ],
              ),
            ),
            if ( storageQuery == "")
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    
                    Text(
                      'Search for your favorite movies and shows!',
                      style: TextStyle(
                        color: inactive_accent,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      
    );
  }
}
