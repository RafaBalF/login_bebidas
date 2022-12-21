import 'package:analyzer/error/error.dart';
import 'package:mobx/mobx.dart';

import 'models/client.dart';
part 'controller.g.dart';

class Controller = _ControllerBase with _$Controller;

abstract class _ControllerBase with Store {
  var client = Client();

  @computed
  bool get isValid {
    return validateLogin() == null && validateSenha() == null;
  }

  String? validateLogin() {
    if (client.login == '' || client.login.isEmpty) {
      return "este campo é obrigatorio";
    } else if (client.login.length < 6) {
      return "seu login precisa ter mais de 5 caracteres";
    }
    return null;
  }

  String? validateSenha() {
    if (client.senha == '' || client.senha.isEmpty) {
      return "este campo é obrigatorio";
    } else if (client.senha.length < 6) {
      return "sua senha precisa ter mais de 5 caracteres";
    }
    return null;
  }
}
