import 'package:diver/models/diver_team.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class InformationDiverCard extends StatelessWidget {
  Diver diver;
  InformationDiverCard({Key? key, required this.diver}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 29,
        backgroundColor: Colors.transparent,
        backgroundImage: CachedNetworkImageProvider(
          diver.imageUrl ?? '',
        ),
      ),
      title: Text(
        '${diver.name}',
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${diver.phone}'),
          Text('${diver.email}'),
        ],
      ),
    );
  }
}
