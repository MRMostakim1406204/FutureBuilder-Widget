import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Future<String> getData(){
  return Future.delayed(Duration(seconds: 4),(){
  throw "Something Wrong";
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Future Builder"),
        centerTitle: true,
      ),
      body: SafeArea(child: Center(
          child: FutureBuilder(
            future: getData(),
             builder: (context,snapshort) {
              if (snapshort.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              if(snapshort.hasData){
                return Text(snapshort.data.toString());
              }
              else{
                 return Text(snapshort.error.toString());
              }
             }
             ),
      )),
    );
  }
}