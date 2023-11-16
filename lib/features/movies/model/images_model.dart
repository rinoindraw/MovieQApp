import 'dart:convert';

class ImageListData {
  List<ImagesModel> backdrops = [];
  List<ImagesModel> logos = [];
  List<ImagesModel> posters = [];

  operator [](String key) {
    switch (key) {
      case 'backdrops':
        return backdrops;
      case 'logos':
        return logos;
      case 'posters':
        return posters;
    }
    return [];
  }

  operator []=(String key, List<ImagesModel> data) {
    switch (key) {
      case 'backdrops':
        backdrops = data;
        break;
      case 'logos':
        logos = data;
        break;
      case 'posters':
        posters = data;
        break;
    }
  }
}

class ImagesModel {
  double aspectRatio = 1.0;
  int height = 0;
  String iso_639_1 = "en";
  String filePath = "";
  double voteAverage = 0;
  int voteCount = 0;
  int width = 0;
  ImagesModel({
    required this.aspectRatio,
    required this.height,
    required this.iso_639_1,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'aspect_ratio': aspectRatio,
      'height': height,
      'iso_639_1': iso_639_1,
      'file_path': filePath,
      'vote_average': voteAverage,
      'vote_count': voteCount,
      'width': width,
    };
  }

  factory ImagesModel.fromMap(Map<String, dynamic> map) {
    return ImagesModel(
      aspectRatio: map['aspect_ratio'],
      height: map['height'],
      iso_639_1: map['iso_639_1'],
      filePath: map['file_path'],
      voteAverage: map['vote_average'],
      voteCount: map['vote_count'],
      width: map['width'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ImagesModel.fromJson(String source) =>
      ImagesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ImagesModel(aspect_ratio: $aspectRatio, height: $height, iso_639_1: $iso_639_1, file_path: $filePath, vote_average: $voteAverage, vote_count: $voteCount, width: $width)';
  }
}
