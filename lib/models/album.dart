class Album {
  final String title;
  final int number;
  final int year;
  final int yearInColor;
  final String image;
  final String resume;

  Album(
      {required this.title,
      required this.number,
      required this.year,
      required this.yearInColor,
      required this.image,
      required this.resume});

  @override
  String toString() {
    return 'Album{title: $title, number: $number, year: $year, yearInColor: $yearInColor, image: $image, resume: $resume}';
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      title: json['titre'] ?? '',
      number: json['numero'] ?? 0,
      year: json['parution'] ?? 0,
      yearInColor:  0,
      image: json['image'] != null ? 'pictures/${json['image']}' : '',
      resume: json['resume'] ?? '',
    );
  }
}
