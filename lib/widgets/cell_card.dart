import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class CellCard extends StatefulWidget {
  const CellCard({Key? key}) : super(key: key);

  @override
  _CellCardState createState() => _CellCardState();
}

class _CellCardState extends State<CellCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => PokemonDetailsScreen(pokemon: _pokemon!, pokemonUrl: widget.pokemonUrl,)),
        // );
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        color: Colors.teal[100],
        child: const Text("He'd have you all unravel at the"),
      ),
      //  Container(
      //   decoration: const BoxDecoration(
      //       borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(5),
      //           bottomRight: Radius.circular(5)),
      //       color: Colors.white),
      //   child: SizedBox(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Expanded(
      //           flex: 5,
      //           child: Container(
      //             // color: pokemonBackgroundColor(
      //             //     typesCount: _pokemon!.types.length),

      //             child: CachedNetworkImage(
      //               imageUrl:
      //                   'https://d2homsd77vx6d2.cloudfront.net/cache/c/f/cfe936a8e7a8c0a644f74fe09e4b17e0.jpg',
      //               progressIndicatorBuilder:
      //                   (context, url, downloadProgress) => Center(
      //                 child: CircularProgressIndicator(
      //                     value: downloadProgress.progress),
      //               ),
      //               errorWidget: (context, url, error) =>
      //                   const Icon(Icons.error),
      //             ),
      //           ),
      //         ),
      //         Expanded(
      //             flex: 3,
      //             child: Padding(
      //               padding: const EdgeInsets.only(left: 10),
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.spaceAround,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text(
      //                         'Cell id',
      //                         style: const TextStyle(
      //                           // color: kTextDarkGrayColor,
      //                           fontSize: 15,
      //                         ),
      //                       ),
      //                       Text(
      //                         'Status',
      //                         style: const TextStyle(
      //                           // color: kTextBlackColor,
      //                           fontSize: 18,
      //                           fontWeight: FontWeight.bold,
      //                         ),
      //                       ),
      //                     ],
      //                   ),
      //                   Text(
      //                     'Trang thai',
      //                     overflow: TextOverflow.ellipsis,
      //                     maxLines: 2,
      //                     style: const TextStyle(
      //                       // color: kTextDarkGrayColor,
      //                       fontSize: 15,
      //                     ),
      //                   ),
      //                 ],
      //               ),
      //             )),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
