import 'package:flutter/material.dart';
import 'package:basic/widgets/block1.dart';
import 'package:basic/widgets/blocksDetects.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Removendo a cor de fundo
      
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Calculando a largura do conjunto de imagens e texto proporcionalmente à largura da tela
              double imageSize = constraints.maxWidth * 0.4; // 40% da largura da tela
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: imageSize,
                    child: Blocks(),
                  ),
                  SizedBox(width: 8), // Espaçamento entre Blocks e Moreblocks
                  SizedBox(
                    width: imageSize,
                    child: Moreblocks(),
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
