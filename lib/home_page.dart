import 'dart:async';

import 'package:cook/card.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _cardList = ["A", "K", "J", "Q"];
   List<String> _showCardList = [];
   Timer? zogsoo;
  int _timer = 1000;

  @override
  void initState() {
    super.initState();
    _cardList.shuffle();
    zogsoo = Timer.periodic(const Duration(milliseconds: 10), (timer) {
      if (_timer > 0) 


        setState(() {
          _timer = _timer - 1;
        });
      
    });
  }

  void onClickCard(String title) {
    if(title == "A"){
      zogsoo?.cancel();
    }
    setState(() {
      _showCardList.add(title);
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(children:[
        Align(alignment: Alignment.bottomCenter,
        child: Container(
          height: height*_timer/1000,
          color: Colors.brown.shade100,
        ),
        ),
        Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "хугацаа:$_timer",
            style: const TextStyle(fontSize: 24),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCard(
                _cardList[0],
                onTap: onClickCard,
                active: _showCardList.contains(_cardList[0]),),
              
              const SizedBox(
                width: 50,
              ),
              MyCard(
                _cardList[1],
                onTap: onClickCard,
               active: _showCardList.contains(_cardList[1]),
              ),
            ],
            ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyCard(
                _cardList[2],
                onTap: onClickCard,
                active: _showCardList.contains(_cardList[2]),
              ),
              const SizedBox(
                width: 50,
              ),
              MyCard(
                _cardList[3],
                onTap: onClickCard,
                active: _showCardList.contains(_cardList[3]),
              ),
            ],
          ),
        ],
      ),
      ]
      ),
    );
  }
}
