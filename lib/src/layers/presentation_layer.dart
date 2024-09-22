import 'feature_layer.dart';

/// Presentation Layer implementation
class PresentationLayer extends FeatureLayer {
  PresentationLayer(super.featureName);

  String get screenContent => '''
import 'package:flutter/material.dart';

class ${pascalCaseFeatureName}Screen extends StatelessWidget {
  const ${pascalCaseFeatureName}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
''';

  String get cubitContent => '''
import 'package:flutter_bloc/flutter_bloc.dart';

part '${featureName}_states.dart';

class ${pascalCaseFeatureName}Cubit extends Cubit<${pascalCaseFeatureName}States> {
  /// Attributes

  /// Constructor
  ${pascalCaseFeatureName}Cubit() : super(${pascalCaseFeatureName}InitialState());

  /// Methods
  static ${pascalCaseFeatureName}Cubit of(context) => BlocProvider.of<${pascalCaseFeatureName}Cubit>(context);
}
''';

  String get statesContent => '''
part of '${featureName}_cubit.dart';

abstract class ${pascalCaseFeatureName}States {}

class ${pascalCaseFeatureName}InitialState extends ${pascalCaseFeatureName}States {}
''';

  @override
  Map<String, List<Map<String, String>>> getStructure() {
    return {
      'presentation/screens': [
        {
          '${featureName}_screen.dart': screenContent,
        },
      ],
      'presentation/widgets': [
        {
          'dummy.dart': '',
        },
      ],
      'presentation/blocs/$featureName': [
        {
          '${featureName}_cubit.dart': cubitContent,
        },
        {
          '${featureName}_states.dart': statesContent,
        }
      ],
    };
  }
}
