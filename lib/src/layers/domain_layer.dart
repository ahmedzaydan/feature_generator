import 'feature_layer.dart';

/// Domain Layer implementation
class DomainLayer extends FeatureLayer {
  DomainLayer(super.featureName);

  String get repositoryContent => '''
import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';

abstract class ${pascalCaseFeatureName}Repository {}
''';

  @override
  Map<String, List<Map<String, String>>> getStructure() {
    return {
      'domain/entities': [
        {
          'dummy.dart': '',
        },
      ],
      'domain/repositories': [
        {
          '${featureName}_repository.dart': repositoryContent,
        }
      ],
      'domain/usecases': [
        {
          'dummy_usecase.dart': '',
        },
      ],
    };
  }
}
