import 'package:flutter/material.dart';
import 'package:basic/widgets/block1.dart';
import 'package:basic/widgets/blocksDetects.dart';

class GameWidget extends StatelessWidget {
  final String playerName;
  final List<String> blocksImages;
  final List<String> moreBlocksImages;

  const GameWidget({
    Key? key,
    required this.playerName,
    required this.blocksImages,
    required this.moreBlocksImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFFFEBB5),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              double imageSize = constraints.maxWidth * 0.4;
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: imageSize,
                    child: Blocks(images: blocksImages),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    width: imageSize,
                    child: Moreblocks(images: moreBlocksImages),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
