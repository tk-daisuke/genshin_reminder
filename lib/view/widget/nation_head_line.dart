import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NationHeadLine extends StatelessWidget {
  const NationHeadLine({
    Key? key,
    required this.from,
    required this.domain,
    required this.assetPath,
  }) : super(key: key);
  final String from;
  final String domain;
  final String assetPath;

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Container(
            constraints: const BoxConstraints(minWidth: 40, maxWidth: 65),
            child: Image(
                image: AssetImage(assetPath),
                // height: 38,
                width: _size.width * 0.1),
          ),
        ),
        Flexible(
          child: AutoSizeText(
            from,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            minFontSize: 10,
            maxFontSize: 20,
            // textScaleFactor: 1,
          ),
        ),
        // const FlexibleSpaceBar(
        //   title: Text('a'),
        // ),
        const SizedBox(
          width: 5,
        ),
        Flexible(
          child: AutoSizeText(
            domain,
            minFontSize: 10,
            maxFontSize: 18,
             // textScaleFactor: 1,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
