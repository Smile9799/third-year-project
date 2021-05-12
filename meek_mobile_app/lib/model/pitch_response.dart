import 'dart:convert';

PitchResponse pitchResponseFromJson(String str) => PitchResponse.fromJson(json.decode(str));

String pitchResponseToJson(PitchResponse data) => json.encode(data.toJson());

class PitchResponse {
  PitchResponse({
    this.status,
    this.message,
  });

  String status;
  String message;

  factory PitchResponse.fromJson(Map<String, dynamic> json) => PitchResponse(
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
  };
}