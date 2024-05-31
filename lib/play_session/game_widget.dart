import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:basic/widgets/block1.dart';
import 'package:basic/widgets/blocksDetects.dart';
import 'package:basic/style/my_button.dart';

class GameWidget extends StatefulWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  _GameWidgetState createState() => _GameWidgetState();
}

class _GameWidgetState extends State<GameWidget> {
  final GlobalKey<BlocksState> _blocksKey = GlobalKey<BlocksState>();
  final GlobalKey<MoreblocksState> _moreblocksKey =
      GlobalKey<MoreblocksState>();

  Future<bool> compareImages(String path1, String path2) async {
    ByteData data1 = await rootBundle.load(path1);
    Uint8List bytes1 = data1.buffer.asUint8List();
    img.Image image1 = img.decodeImage(bytes1)!;

    ByteData data2 = await rootBundle.load(path2);
    Uint8List bytes2 = data2.buffer.asUint8List();
    img.Image image2 = img.decodeImage(bytes2)!;

    if (image1.width != image2.width || image1.height != image2.height) {
      return false;
    }

    for (int y = 0; y < image1.height; y++) {
      for (int x = 0; x < image1.width; x++) {
        if (image1.getPixel(x, y) != image2.getPixel(x, y)) {
          return false;
        }
      }
    }

    return true;
  }

  bool _isLoading = false; // Flag to track loading state

  void _compareBlocksImages() async {
    setState(() {
      _isLoading = true; // Set loading state to true
    });

    List<String> blockPaths = _blocksKey.currentState!.getImagePaths();
    List<String> moreblockPaths = _moreblocksKey.currentState!.getImagePaths();

    bool allTrue = true;

    for (int i = 0; i < 4; i++) {
      bool areEqual = await compareImages(blockPaths[i], moreblockPaths[i]);
      print('Images at index $i are equal: $areEqual');

      if (!areEqual) {
        allTrue = false;
        break;
      }
    }

    setState(() {
      _isLoading = false; // Reset loading state to false
    });

    if (allTrue) {
      _showCongratulationsAlert();
    } else {
      _showErrorAlert();
    }
  }

  void _showCongratulationsAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Parabéns!'),
          content: Text('Você acertou!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorAlert() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Ops!'),
          content: Text('Você errou! Tente novamente.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return _isLoading
        ? Column(
            children: [
              CircularProgressIndicator(), // Indicador de carregamento
              SizedBox(height: 16), // Espaçamento entre o indicador e o texto
              Text('Estamos trazendo o resultado...'), // Texto informativo
            ],
          )
        : SizedBox.shrink(); // Retorna um widget vazio se não estiver carregando
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double containerWidth = constraints.maxWidth * 0.8;
            double imageSize = containerWidth * 0.4;

            return Container(
              width: containerWidth,
              padding: const EdgeInsets.all(24.0),
              color: const Color(0xffb2b1e5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildLoadingIndicator(), // Adiciona o indicador de carregamento e o texto
                  SizedBox(height: 20), // Espaçamento entre o indicador e os widgets existentes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            'Reproduza essa imagem:',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.only(top: 80.0),
                            color: Color(0xFF3e3d78),
                            child: SizedBox(
                              width: containerWidth * 0.2,
                              height: containerWidth * 0.18,
                              child: Blocks(key: _blocksKey),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: imageSize,
                        child: Moreblocks(key: _moreblocksKey),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  MyButton(
                    onPressed: _compareBlocksImages,
                    child: const Text('Compare Images'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(home: GameWidget()));
}
