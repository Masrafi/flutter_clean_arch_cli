import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class DirectoryCreator {
  static void ensureBaseStructure() {
    final dirs = [
      'lib/config',
      'lib/core',
      'lib/feature',
    ];

    for (final dir in dirs) {
      final directory = Directory(dir);
      if (!directory.existsSync()) {
        directory.createSync(recursive: true);
        debugPrint('📁 Created missing base folder: $dir');
      }
    }
  }

  static void createFeatureStructure(String feature) {
    final basePath = 'lib/feature/$feature';
    final structure = [
      'data/data_source',
      'data/model',
      'data/repository',
      'domain/entities',
      'domain/repository',
      'domain/usecases',
      'presentation/bloc',
      'presentation/screen',
      'presentation/widgets',
    ];

    for (final folder in structure) {
      final dir = Directory(p.join(basePath, folder));
      if (!dir.existsSync()) {
        dir.createSync(recursive: true);
        debugPrint('📁 Created: ${dir.path}');
      }
    }
  }
}