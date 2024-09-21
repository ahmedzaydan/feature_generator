import 'package:feature_generator/src/feature_generator.dart';

/// To run the code, use the following command:
/// dart main.dart

void main(List<String> arguments) {
  // Ensure there are enough arguments
  if (arguments.isEmpty) {
    print('Usage: dart run main.dart <featureName> [baseDir]');
    return;
  }

  // Extract arguments
  String featureName = arguments.length > 1 ? arguments[1] : arguments[0];
  String? baseDir = arguments.length > 1 ? arguments[0] : null;

  // Delete if user entered last slash by wrong

  if (baseDir != null && baseDir.endsWith('/')) {
    baseDir = baseDir.substring(0, baseDir.length - 1);
  }

  print("Feature Name: $featureName");
  print("Base Directory: $baseDir");

  // Create an instance of FeatureGenerator and generate a feature
  final featureGenerator = FeatureGenerator(directory: baseDir);

  // Generate the feature
  featureGenerator.createFeature(featureName);
}
