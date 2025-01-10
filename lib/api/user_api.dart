import '../models/api/token_model.dart';

class UserApi {
  Future<TokenModel> getToken() async {
    // TODO: Implement getToken
    return TokenModel(
        tokenId: 1,
        bearerToken: '123',
        reflesToken: '123',
        bearerTokenDate: '123',
        refleshTokenDate: '123');
  }

  Future<bool> login(String email, String password) async {
    // TODO: Implement login
    return true;
  }

  Future<bool> register(String email, String password) async {
    // TODO: Implement register
    return true;
  }

  Future<bool> logout() async {
    // TODO: Implement logout
    return true;
  }

  Future<bool> loginAgain(TokenModel token) async {
    // TODO: Implement updateUser
    return true;
  }
}
