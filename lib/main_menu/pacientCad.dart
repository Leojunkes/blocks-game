import 'package:basic/style/my_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PatientFormPage extends StatefulWidget {
  const PatientFormPage({super.key});

  @override
  _PatientFormPageState createState() => _PatientFormPageState();
}

class _PatientFormPageState extends State<PatientFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _documentController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

  bool _isButtonEnabled = false; // Flag to control button state

  void salvar() {
    final name = _nameController.text;
    final document = _documentController.text;
    final dob = _dobController.text;

    print('Nome: $name');
    print('Documento: $document');
    print('Data de nascimento: $dob');

    GoRouter.of(context).go('/main_menu/play', extra: name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text('Cadastro do Paciente'),
      ),
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: 500,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Criar Perfil do Paciente',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Qual é o nome do paciente?',
                ),
                onChanged: (text) {
                  setState(() {
                    _isButtonEnabled = text.isNotEmpty; // Update button state
                  });
                },
              ),
              SizedBox(height: 20),
              TextField(
                controller: _documentController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Insira um documento de identificação (opcional)',
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _dobController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Qual a data de nascimento do paciente?',
                ),
              ),
              SizedBox(height: 5),
              Text(
                'A data de nascimento é relevante para fins de testes e relatórios.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'Ao criar a conta do paciente, você concorda com os termos de uso e privacidade.',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 20),
              Center(
                child: MyButton(
                  onPressed: _isButtonEnabled ? salvar : null, // Disable if not enabled
                  child: Text('Entrar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
