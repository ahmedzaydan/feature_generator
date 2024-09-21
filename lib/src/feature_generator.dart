import 'dart:io';

import 'layers/data_layer.dart';
import 'layers/domain_layer.dart';
import 'layers/feature_layer.dart';
import 'layers/presentation_layer.dart';

/// Feature Generator class
class FeatureGenerator {
  final String? directory;
  late List<FeatureLayer> layers;

  String get baseDir => directory ?? '../lib/features';

  FeatureGenerator({this.directory});

  /// Helper function to create files and directories from structure
  void createStructure(
    String featureName,
    Map<String, List<Map<String, String>>> structure,
  ) {
    structure.forEach(
      (folder, files) {
        final dir = Directory('$baseDir/$featureName/$folder');

        createDirectory(dir);

        // Create the files inside the directory
        for (var fileMap in files) {
          fileMap.forEach(
            (fileName, content) {
              createFile(
                dir: dir,
                fileName: fileName,
                content: content,
              );
            },
          );
        }
      },
    );
  }

  void createFile({
    required Directory dir,
    required String fileName,
    required String content,
  }) {
    final filePath = File('${dir.path}/$fileName');

    if (!filePath.existsSync()) {
      filePath.createSync();
      filePath.writeAsStringSync(content);
      print('Created ${filePath.path} file with content:\n$content');
    }
  }

  /// Helper function to create directories
  void createDirectory(Directory dir) {
    // Create the directory if it doesn't exist
    if (!dir.existsSync()) {
      dir.createSync(recursive: true);
      print('Created directory: ${dir.path}');
    }

    // Else print that the directory already exists
    else {
      print('Directory ${dir.path} already exists.');
    }
  }

  /// Initialize layers with the feature name and create feature with the structures
  void createFeature(String featureName) {
    // Initialize layers using the passed feature name
    layers = [
      DataLayer(featureName),
      DomainLayer(featureName),
      PresentationLayer(featureName),
    ];

    // Iterate over each layer and create its structure
    for (var layer in layers) {
      final structure = layer.getStructure();
      createStructure(featureName, structure);
    }
  }
}
