import 'dart:io';
import 'package:flutter_clean_arch_cli/src/directory_creator.dart';
import 'package:flutter_clean_arch_cli/src/file_template_generator.dart';

void main() {
  stdout.writeln('🧱 Running example for flutter_clean_arch_cli...');
  
  // Ensure base project structure
  DirectoryCreator.ensureBaseStructure();

  // Create "login" feature
  DirectoryCreator.createFeatureStructure('login');
  FileTemplateGenerator.generateTemplates('login');

  stdout.writeln('✅ Example completed. Check the "lib/feature/login" folder.');
}