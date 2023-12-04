import 'package:flutter/material.dart';

class MovieSearch extends StatelessWidget {
  const MovieSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:const Size.fromHeight(100),
        child: AppBar(
          leading: IconButton(
            onPressed:() {Navigator.pop(context);},
             icon:const Icon(
              Icons.arrow_back_ios,
             )),
             title:const Text("Finder",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
           centerTitle: true,
           bottom: PreferredSize(
            preferredSize:const Size.fromHeight(70),
            child:TextFormField(
              readOnly: true,
              decoration:const  InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                fillColor:Colors.black,filled: true
              ),
            ) ),
        ),
      ),
    );
  }
}