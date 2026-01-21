class LawModel {
  final String title;
  final String coverImage;
  final String pdfUrl;

  LawModel({
    required this.title,
    required this.coverImage,
    required this.pdfUrl,
  });

  factory LawModel.fromJson(Map<String, dynamic> json) {
    return LawModel(
      title     : json['title'],
      coverImage: json['coverImage'],
      pdfUrl    : json['pdfUrl'],
    );
  }
}
