import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../audio/sounds.dart';
import '../player_progress/player_progress.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';
import 'levels.dart';

class LevelSelectionScreen extends StatelessWidget {
  const LevelSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    context.watch<PlayerProgress>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFA2DCC7),
        title: Row(
          children: [
            Image.asset(
              'images/block-principal.png',
              height: 40,
            ),
            const SizedBox(width: 10),
            const Text(
              'Léo',
              style: TextStyle(fontSize: 20),
            ),
            const Spacer(),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
                Card(
                  color: Colors.green,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '+licenças',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      backgroundColor: palette.backgroundLevelSelection,
      body: ResponsiveScreen(
        squarishMainArea: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Tarefas',
                  style: TextStyle(
                    fontFamily: 'Permanent Marker',
                    fontSize: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  for (final level in gameLevels)
                    GestureDetector(
                      onTap: () {
                        final audioController = context.read<AudioController>();
                        audioController.playSfx(SfxType.buttonTap);
                        GoRouter.of(context)
                            .go('/main_menu/play/session/${level.number}');
                      },
                      child: Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'images/block-principal.png',
                              height: 60,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Teste de blocos',
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Level ${level.number}',
                              style: const TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              
                              width: 400,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  maxLines: 3,
                                    'Este teste envolve a reprodução de padrões geométricos usando cubos coloridos. É usado para avaliar habilidades de percepção visual, organização espacial e coordenação motora.'),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  GestureDetector(
                    onTap: () {
                      final audioController = context.read<AudioController>();
                      audioController.playSfx(SfxType.buttonTap);
                      GoRouter.of(context).go('');
                    },
                    child: Container(
                      margin: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'images/block-principal.png',
                            height: 60,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Special Block',
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            'Special Level',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        rectangularMenuArea: MyButton(
          onPressed: () {
            GoRouter.of(context).go('/main_menu');
          },
          child: const Text('Back'),
        ),
      ),
    );
  }
}
