import 'package:tast_for_mobix/core/constants/constant_Values.dart';

import 'response_handler.dart';

class RepositoryHandler implements Exception {

  static void handleTheResponse(int code) {
    print("--------exception code is [$code--------]");

    switch (code) {
      case 200:
        return;
      case 201:
        return;
      case 404:
        throw ResponseHandler(message: notFoundMessage, code: code);
      case 500:
        throw ResponseHandler(message: interServerMessage, code: code);

      default:
        throw ResponseHandler(message: somethingWentWrongMessage, code: code);
    }
  }
}
