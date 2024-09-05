import 'package:args/command_runner.dart';

import '../../../repositories/students_repository.dart';

class FindByIdCommand extends Command {
  final StudentsRepository studentsRepository;

  @override
  String get description => 'Find Students By Id';

  @override
  String get name => 'byId';

  FindByIdCommand(this.studentsRepository) {
    argParser.addOption('id', help: 'Student Id', abbr: 'i');
  }

  @override
  Future<void> run() async {
    if (argResults?['id'] == null) {
      print('Por favor envie o id do aluno com o comando --id=0 ou -i 0');
      return;
    }
    final id = int.parse(argResults?['id']);
    print('Aguarde buscando  Dados...');
    final student = await studentsRepository.findById(id);
    print('-------------------------------------');
    print('Aluno: ${student.name}');
    print('-------------------------------------');

    print('Nome: ${student.name}');
    print('Idade: ${student.age ?? "Não Informado"}');
    print('Curso: ');
    student.nameCourses.forEach(print);
    print('Endereço');
    print('  ${student.address.street} (${student.address.zipCode})');
  }
}
