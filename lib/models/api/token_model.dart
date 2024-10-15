class TokenModel {
  final int tokenId;
  final String bearerToken, reflesToken;
  final String bearerTokenDate, refleshTokenDate;
  TokenModel({
    required this.tokenId,
    required this.bearerToken,
    required this.reflesToken,
    required this.bearerTokenDate,
    required this.refleshTokenDate,
  });
}
