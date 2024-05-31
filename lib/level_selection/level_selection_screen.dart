import 'package:flutter/material.dart';
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
  final String? name;

  LevelSelectionScreen({this.name, required Key key}) : super(key: key);

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
            Text(
              "Bem vindo ${name ?? ''}",
              style: const TextStyle(fontSize: 20),
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFFa2dcc7),
              ),
              child: Text(
                
                'Bateria de testes',
                style: TextStyle(
                  color: Color(0xff3c374b),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                GoRouter.of(context).go('/main_menu');
              },
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                GoRouter.of(context).go('');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Pacientes'),
              onTap: () {
                GoRouter.of(context).go('');
              },
            ),
            ListTile(
              leading: const Icon(Icons.task),
              title: const Text('Atividades'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.calendar_month),
              title: const Text('Calendário'),
              onTap: () {},
            ),
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
                          color: Colors.grey[100],
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
                              'Teste de blocos',
                              style: TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              'Level 1',
                              style: TextStyle(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 400,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'Este teste envolve a reprodução de padrões geométricos usando cubos coloridos. É usado para avaliar habilidades de percepção visual, organização espacial e coordenação motora.',
                                  maxLines: 3,
                                ),
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
                        color: Colors.grey[100],
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
