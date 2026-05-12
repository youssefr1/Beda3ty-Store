class UploadImageResponse {
  UploadImageResponse(this.location);

  factory UploadImageResponse.fromJson(Map<String, dynamic> json) =>
      UploadImageResponse(json['location'] as String?);

  final String? location;
}
