import 'package:flutter/material.dart';
import 'dart:math';

class Blocks extends StatefulWidget {
  const Blocks({Key? key}) : super(key: key);

  @override
  _BlocksState createState() => _BlocksState();
}

class _BlocksState extends State<Blocks> {
  final List<String> _imageOptions = [
    'images/cubo75Bc.png',
    'images/cubo75Pt.png',
    'images/cuboBranco.png',
    'images/cubopreto.png',
  ];

  late List<String> _imagePaths;

  @override
  void initState() {
    super.initState();
    _shuffleImages();
  }

  void _shuffleImages() {
    final random = Random();
    _imagePaths = List.generate(4, (_) => _imageOptions[random.nextInt(_imageOptions.length)]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Reproduza essa imagem',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 10),
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
    return Container(
      padding: EdgeInsets.all(0),
      child: Image.asset(
        _imagePaths[index],
        width: 50,
        height: 50,
      ),
    );
  }
}

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Container(
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              const Blocks(),
              const SizedBox(width: 0), // Espaçamento entre os blocos
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
