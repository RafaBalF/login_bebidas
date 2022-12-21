import 'package:mobx/mobx.dart';
part 'client.g.dart';

class Client = _ClientBase with _$Client;

abstract class _ClientBase with Store {
  @observable
  String login = '';
  @action
  chaLogin(String value) => login = value;

  @observable
  String senha = '';
  @action
  chaSenha(String value) => senha = value;
}
