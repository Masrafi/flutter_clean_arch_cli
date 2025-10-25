import 'dart:io';
import 'package:path/path.dart' as p;

class FileTemplateGenerator {
  static void generateTemplates(String feature) {
    final basePath = 'lib/feature/$feature';

    final files = {
      'data/data_source/${feature}_api_service.dart':
          'class ${_capitalize(feature)}ApiService {}',
      'data/model/${feature}_model.dart':
          'class ${_capitalize(feature)}Model {}',
      'data/repository/${feature}_repository_impl.dart':
          'class ${_capitalize(feature)}RepositoryImpl {}',
      'domain/entities/${feature}_entity.dart':
          'class ${_capitalize(feature)}Entity {}',
      'domain/repository/${feature}_repository.dart':
          'abstract class ${_capitalize(feature)}Repository {}',
      'domain/usecases/${feature}_usecase.dart':
          'class ${_capitalize(feature)}UseCase {}',
      'presentation/bloc/${feature}_bloc.dart':
          'class ${_capitalize(feature)}Bloc {}',
      'presentation/bloc/${feature}_event.dart':
          'class ${_capitalize(feature)}Event {}',
      'presentation/bloc/${feature}_state.dart':
          'class ${_capitalize(feature)}State {}',
      'presentation/screen/${feature}_screen.dart':
          'class ${_capitalize(feature)}Screen {}',
      'presentation/widgets/${feature}_widget.dart':
          'class ${_capitalize(feature)}Widget {}',
    };

    files.forEach((path, content) {
      final file = File(p.join(basePath, path));
      if (!file.existsSync()) {
        file.writeAsStringSync('// ignore_for_file: camel_case_types\n\n$content');
        stdout.writeln('📝 Created: ${file.path}');
      }
    });
  }

  static String _capitalize(String text) =>
      text[0].toUpperCase() + text.substring(1);
}