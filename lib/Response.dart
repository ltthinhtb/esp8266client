class Response {
  final double temp;
  final double humidity;

  Response({this.temp, this.humidity});

  factory Response.fromJson(Map<dynamic, dynamic> json) {
    double parser(dynamic source) {
      try {
        return double.parse(source.toString());
      } on FormatException {
        return -1;
      }
    }

    return Response(
        temp: parser(json['Temperature']), humidity: parser(json['Humidity']));
  }
}
