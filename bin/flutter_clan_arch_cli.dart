import 'dart:io';
import 'package:args/args.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_clean_arch_cli/src/directory_creator.dart';
import 'package:flutter_clean_arch_cli/src/file_template_generator.dart';

void main(List<String> arguments) {
  final parser = ArgParser()
    ..addCommand('init')
    ..addCommand('create')
    ..addFlag('force', abbr: 'f', negatable: false, help: 'Force recreate feature');

  final argResults = parser.parse(arguments);

  if (argResults.command?.name == 'init') {
    _initProject();
  } else if (argResults.command?.name == 'create') {
    final featureName = argResults.command?.rest.isNotEmpty == true
        ? argResults.command!.rest.first
        : null;
    final force = argResults['force'] as bool;

    if (featureName == null) {
      debugPrint('❌ Please provide a feature name. Example: flutter_clean_arch create login');
      exit(1);
    }

    _createFeature(featureName, force: force);
  } else {
    debugPrint('''
🧱 Flutter Clean Architecture CLI

Usage:
  flutter_clean_arch init                  Initialize config, core, and feature folders
  flutter_clean_arch create <feature>      Create a feature (e.g. login)
  flutter_clean_arch create <feature> -f   Force recreate a feature

Example:
  flutter_clean_arch create login
''');
  }
}

void _initProject() {
  debugPrint('⚙️  Checking base folders...');
  DirectoryCreator.ensureBaseStructure();
  debugPrint('✅ Project initialized successfully!');
}

void _createFeature(String feature, {bool force = false}) {
  final featurePath = 'lib/feature/$feature';
  final featureDir = Directory(featurePath);

  if (featureDir.existsSync() && force) {
    featureDir.deleteSync(recursive: true);
    debugPrint('♻️  Old feature "$feature" removed (force mode).');
  }

  DirectoryCreator.ensureBaseStructure();
  DirectoryCreator.createFeatureStructure(feature);
  FileTemplateGenerator.generateTemplates(feature);

  debugPrint('✅ Feature "$feature" created/updated successfully!');
}