import 'package:flutter/material.dart';
import 'package:basic/widgets/block1.dart';
import 'package:basic/widgets/blocksDetects.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key}) : super(key: key);

  void _validateImages(BuildContext context, List<String> blocksImages,
      List<String> moreBlocksImages) {
    // Lógica para comparar as imagens
    bool areImagesEqual = true;
    for (int i = 0; i < blocksImages.length; i++) {
      if (blocksImages[i] != moreBlocksImages[i]) {
        areImagesEqual = false;
        break;
      }
    }

    // Exibir resultado da validação
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(areImagesEqual
            ? 'As imagens são iguais!'
            : 'As imagens não são iguais!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<String> blocksImages = [
      'images/cubo75Bc.png',
      'images/cubo75Pt.png',
      'images/cuboBranco.png',
      'images/cubopreto.png',
      // Adicione suas imagens aqui...
    ];

    final List<String> moreBlocksImages = [
      'images/cubo75Bc.png',
      'images/cubo75Pt.png',
      'images/cuboBranco.png',
      'images/cubopreto.png',
      // Adicione suas imagens aqui...
    ];

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(0xFFFFEBB5),
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(12.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color(0xFFFFEBB5), // Alterando para a cor #ffebb5
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Blocks(images: blocksImages),
                    ),
                    SizedBox(width: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Moreblocks(images: moreBlocksImages),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () => _validateImages(
                    context, blocksImages, moreBlocksImages),
                child: Text('Validar Imagens'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
