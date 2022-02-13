class ResponseModel {
  int? status;
  String? msg;
  dynamic data;

  ResponseModel({
    this.status,
    this.msg,
    this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json['status'],
        msg: json['msg'],
        data: json['data'],
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'msg': msg,
        'data': data == null ? null : List<dynamic>.from(data!.map((x) => x)),
      };
}
