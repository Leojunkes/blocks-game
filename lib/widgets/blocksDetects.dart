import 'dart:math';
import 'package:flutter/material.dart';

class Moreblocks extends StatefulWidget {
  const Moreblocks({Key? key}) : super(key: key);

  @override
  MoreblocksState createState() => MoreblocksState();
}

class MoreblocksState extends State<Moreblocks> {
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
    _initializeImages();
  }

  void _initializeImages() {
    final random = Random();
    _imagePaths = List.generate(4, (_) => _imageOptions[random.nextInt(_imageOptions.length)]);
  }

  void _changeImage(int index) {
    final random = Random();
    setState(() {
      List<String> availableOptions = List.from(_imageOptions)..remove(_imagePaths[index]);
      _imagePaths[index] = availableOptions[random.nextInt(availableOptions.length)];
    });
  }

  List<String> getImagePaths() {
    return _imagePaths;
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
          width: 95,
          height: 95,
        ),
      ),
    );
  }
}
