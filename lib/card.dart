import 'package:flutter/material.dart';


class MyCard extends StatelessWidget {
  final String  title;
  final bool active;
  final void Function(String) onTap;
  const MyCard(this.title,{super.key, this.active = true, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return  
    InkWell(
      onTap: ()=>onTap(title),
      child: Container(
        width: 100,
        height: 200,
        // ignore: prefer_const_constructors
        decoration: BoxDecoration(
          color: Colors.blueAccent
        ),
        child:Visibility(
          visible: active,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 30),
          ),
        ),)
      ),
    );
  }
}