
# Feature Generator

A Dart package that helps generate feature-based folder and file structures in your Flutter project, following a clean architecture pattern (Data, Domain, Presentation layers).

## Features

- Automatically generates the necessary files for each feature (e.g., Cubit, Repository, Data Source, Screen).
- Supports multiple layers (Data, Domain, Presentation).
- Customizable base directory for placing your generated feature files.

## Getting Started

### Installation

1. Add this package to your Flutter project by including it in your `pubspec.yaml` file:

```yaml
dependencies:
  feature_generator:
    git:
      url: https://github.com/your-username/feature_generator.git
      ref: main
```

2. Run the following command to install the package:

```bash
flutter pub get
```

### Usage

To generate a new feature with this package, you can run the following command from your terminal in your Flutter project:

```bash
dart run feature_generator:main <base_dir(optional)> <your_feature_name>
```

#### Parameters:

- **`<base_dir>` (optional)**: The base directory where the feature folder will be created. If not provided, it defaults to `lib/features/`.
- **`<your_feature_name>`**: The name of the feature you want to generate (e.g., `auth`, `profile`, etc.).

#### Example:

```bash
dart run feature_generator:main lib/features auth
```

This command will generate an `auth` feature under the `lib/features/` directory with the following structure:

```
lib/features/auth/
├─ data/
│   ├─ models/
│   ├─ data_sources/
│   │   ├─ auth_remote_data_source.dart
│   ├─ repository_implementers/
│   │   ├─ auth_repository_implementer.dart
├─ domain/
│   ├─ entities/
│   ├─ repositories/
│   │   ├─ auth_repository.dart
│   ├─ usecases/
├─ presentation/
│   ├─ blocs/
│   │   ├─ auth/
│   │   │   ├─ auth_cubit.dart
│   │   │   ├─ auth_states.dart
│   ├─ screens/
│   │   ├─ auth_screen.dart
│   ├─ widgets/
```

### Development

To make changes to this package:

1. Clone the repository:

```bash
git clone https://github.com/your-username/feature_generator.git
```

2. Make your changes and test locally using the `dart run` command.

```bash
dart run bin/main.dart <base_dir(optional)> <your_feature_name>
```

### Contributing

Contributions are welcome! Feel free to submit issues or pull requests to improve this package.

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
