import 'package:args/command_runner.dart';

import '../../repositories/students_repository.dart';
import 'subcommands/find_all_command.dart';
import 'subcommands/find_by_id_command.dart';

class StudentsCommand extends Command {
  @override
  String get description => 'Students Operations';

  @override
  String get name => 'students';

  StudentsCommand() {
    final studentsRepository = StudentsRepository();
    addSubcommand(FindAllCommand(studentsRepository));
    addSubcommand(FindByIdCommand(studentsRepository));
  }
}
