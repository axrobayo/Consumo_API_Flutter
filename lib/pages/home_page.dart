

import 'package:chuck_norris/models/chuck_model.dart';
import 'package:chuck_norris/services/chuck_service.dart';
import 'package:chuck_norris/widgets/chuck_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
 const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class  HomePageState extends State <HomePage> {
  final ServiceChuck _service= ServiceChuck();
  List<Chuck>? _listChuck;
  @override
  void initState() {
    super.initState();
    _downloadContent();    
  }
  @override
  Widget build(BuildContext context) {
    return _listChuck==null ?
    const Center(
      child: SizedBox(
        height: 50.0, width: 50.0, child: CircleAvatar(),
      ),
    )
    :Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 1.0),
      child: ListView(
        children: _listChuck!
        .map((e) => ChuckCard(model: e)).toList()
      ),
    );
  }
  _downloadContent() async{
    _listChuck= await _service.getChuck();
    setState(() {});
  }
}