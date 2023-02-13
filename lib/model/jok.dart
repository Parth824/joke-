class joka {
  String time;
  String values;

  joka({required this.time, required this.values});

  factory joka.formjson({required Map data}) {
    return joka(time: data["created_at"], values: data["value"]);
  }
}
