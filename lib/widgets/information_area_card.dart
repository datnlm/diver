import 'package:diver/models/diver_team.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class InformationAreaCard extends StatelessWidget {
  Area area;
  InformationAreaCard({Key? key, required this.area}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${area.name}',
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      subtitle: Text('${area.address}'),
    );
  }
}
