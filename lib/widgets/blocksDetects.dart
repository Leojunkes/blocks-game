import 'package:flutter/material.dart';
import 'dart:math';

class Moreblocks extends StatefulWidget {
  final List<String> images;

  const Moreblocks({Key? key, required this.images}) : super(key: key);

  @override
  _MoreblocksState createState() => _MoreblocksState();
}

class _MoreblocksState extends State<Moreblocks> {
  late List<String> _imagePaths;

  @override
  void initState() {
    super.initState();
    _initializeImages();
  }

  void _initializeImages() {
    final random = Random();
    _imagePaths = List.generate(4, (_) => widget.images[random.nextInt(widget.images.length)]);
  }

  void _changeImage(int index) {
    final random = Random();
    setState(() {
      List<String> availableOptions = List.from(widget.images)..remove(_imagePaths[index]);
      _imagePaths[index] = availableOptions[random.nextInt(availableOptions.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildColorBlock(context, 0),
            _buildColorBlock(context, 1),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildColorBlock(context, 2),
            _buildColorBlock(context, 3),
          ],
        ),
      ],
    );
  }

  Widget _buildColorBlock(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _changeImage(index);
      },
      child: Container(
        padding: EdgeInsets.all(0),
        child: Image.asset(
          _imagePaths[index],
          width: 80,
          height: 80,
        ),
      ),
    );
  }
}

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> imageOptions = [
      'images/cubo75Bc.png',
      'images/cubo75Pt.png',
      'images/cuboBranco.png',
      'images/cubopreto.png',
    ];

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.8, // Definindo a altura como 80% da altura da tela
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Moreblocks(images: imageOptions),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(GameWidget());
}
