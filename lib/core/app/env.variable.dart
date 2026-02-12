import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, production }

class EnvVariable {
  EnvVariable._();
  static final EnvVariable instance = EnvVariable._();

  String _envType = "unknown";

  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: ".env.dev");
        break;

      case EnvTypeEnum.production:
        await dotenv.load(fileName: ".env.production");
        break;
    }

    _envType = dotenv.get('ENV_TYPE', fallback: "unknown");
  }

  bool get debugMode => _envType == 'dev';
}
