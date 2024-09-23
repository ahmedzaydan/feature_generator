import 'feature_layer.dart';

/// Data Layer implementation
class DataLayer extends FeatureLayer {
  DataLayer(super.featureName);

  String get remoteDataSourceContent => '''
import '../../../../core/api/api_consumer.dart';

abstract class ${pascalCaseFeatureName}RemoteDataSource {}

class ${pascalCaseFeatureName}RemoteDataSourceImplementer implements ${pascalCaseFeatureName}RemoteDataSource {
  final ApiConsumer _apiConsumer;

  ${pascalCaseFeatureName}RemoteDataSourceImplementer(this._apiConsumer);
}''';

  String get repositoryImplementerContent => '''
import '../../../../core/error/exception.dart';
import '../../../../core/error/failures.dart';
import '../../../${featureName}/data/data_sources/${featureName}_remote_data_soucre.dart';
import '../../domain/repositories/${featureName}_repository.dart';

class ${pascalCaseFeatureName}RepositoryImplementer implements ${pascalCaseFeatureName}Repository {
  final AuthRemoteDataSoucre _remoteDataSoucre;

  ${pascalCaseFeatureName}RepositoryImplementer(this._remoteDataSoucre);
}
''';

  @override
  Map<String, List<Map<String, String>>> getStructure() {
    return {
      'data/models': [
        {
          '${featureName}_model.dart': '',
        },
      ],
      'data/data_sources': [
        {
          '${featureName}_remote_data_source.dart': remoteDataSourceContent,
        }
      ],
      'data/repository_implementers': [
        {
          '${featureName}_repository_implementer.dart':
              repositoryImplementerContent,
        }
      ],
    };
  }
}
