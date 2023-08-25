class User {
  int user_id;
  String user_name;
  String user_email;
  String user_password;

  User(this.user_id, this.user_name, this.user_email, this.user_password);

  // 로그인에 성공한 user 의 json 데이터를 가져온다.
  // login.php 에서 json 포맷으로 담긴 user data 를 일반 포맷으로 컨버팅 해주어야 한다.
  factory User.fromJson(Map<String, dynamic> json) => User(
    int.parse(json['user_id']),
    json['user_name'],
    json['user_email'],
    json['user_password']
  );

  // String = key, dynamic = value
  // 데이터를 Json 포맷으로 바꾸기
  Map<String, dynamic> toJson() => {
    'user_id' : user_id.toString(),
    'user_name' : user_name,
    'user_email' : user_email,
    'user_password ' : user_password
  };
}