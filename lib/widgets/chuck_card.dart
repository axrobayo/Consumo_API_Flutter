import 'package:chuck_norris/models/chuck_model.dart';
import 'package:flutter/material.dart';

class ChuckCard extends StatelessWidget {
  const ChuckCard({Key? key, required this.model}) : super(key: key);
  final Chuck model;

  @override
  Widget build(BuildContext context) {
    final urlImg=model.iconUrl!;
    return Card(
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(urlImg)),
        title: Text(model.value ?? ""),
        subtitle: Text(model.url ?? ""),
        trailing: Text(model.createdAt.toString().substring(0,16))
      ),
    );
  }
}
