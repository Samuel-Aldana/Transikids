class RespuestaLogin {
  final int id;
  final String username;
  final String accessToken;
  final String refreshToken;

  RespuestaLogin({
    required this.id,
    required this.username,
    required this.accessToken,
    required this.refreshToken,
  });

  factory RespuestaLogin.fromJson(Map<String, dynamic> json) {
    return RespuestaLogin(
      id: json['id'],
      username: json['username'],
      accessToken: json['accessToken'],
      refreshToken: json['refreshToken'],
    );
  }
}