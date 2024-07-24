import 'package:basic/main_menu/pacientCad.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../audio/audio_controller.dart';
import '../settings/settings.dart';
import '../style/my_button.dart';
import '../style/palette.dart';
import '../style/responsive_screen.dart';

class MainMenuScreen extends StatelessWidget {
  final String? nome;

  const MainMenuScreen({this.nome, required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final settingsController = context.watch<SettingsController>();
    final audioController = context.watch<AudioController>();

    return Scaffold(
      backgroundColor: palette.backgroundMain,
      body: Stack(
        children: [
          Center(
            child: Opacity(
              opacity: 0.1,
              child: Image.asset(
                '/images/rubiks_cube.png',
                width: 300, // Ajuste o tamanho conforme necessário
              ),
            ),
          ),
          ResponsiveScreen(
            squarishMainArea: Center(
              child: Transform.rotate(
                angle: -0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Teste Visuo Construtivo!",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poetsen One',
                        fontSize: 55,
                        height: 1,
                      ),
                    ),
                    Text(
                      "Bem vindo ${nome ?? ''}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poetsen One',
                        fontSize: 48,
                        height: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            rectangularMenuArea: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                
                MyButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PatientFormPage()));
                  },
                  child: const Text('Cadastrar Paciente'),
                ),
                _gap,
                MyButton(
                  onPressed: () =>
                      GoRouter.of(context).push('/main_menu/settings'),
                  child: const Text('Settings'),
                ),
                _gap,
                Padding(
                  padding: const EdgeInsets.only(top: 32),
                  child: ValueListenableBuilder<bool>(
                    valueListenable: settingsController.audioOn,
                    builder: (context, audioOn, child) {
                      return IconButton(
                        onPressed: settingsController.toggleAudioOn,
                        icon:
                            Icon(audioOn ? Icons.volume_up : Icons.volume_off),
                      );
                    },
                  ),
                ),
                _gap,
                const Text('Music by Mr Smith'),
                _gap,
              ],
            ),
          ),
        ],
      ),
    );
  }

  static const _gap = SizedBox(height: 10);
}
