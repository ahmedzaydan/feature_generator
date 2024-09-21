/// Abstract class for defining feature layer structure
abstract class FeatureLayer {
  final String featureName;

  FeatureLayer(this.featureName);

  /// Concrete getter to convert snake_case to PascalCase
  String get pascalCaseFeatureName {
    return featureName
        .split('_')
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join('');
  }

  /// Method to get the structure of the layer
  Map<String, List<Map<String, String>>> getStructure();
}
