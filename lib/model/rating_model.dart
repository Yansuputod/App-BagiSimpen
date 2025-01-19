
class RatingModel {
  final String userName;
  final String userImage; 
  final int rating; 
  final String comment; 

  RatingModel({
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.comment,
  });
}

final List<RatingModel> ratings = [
  RatingModel(
    userName: "Gunantha Wira",
    userImage: "assets/icons/userIcon.jpeg", 
    rating: 4,
    comment: "Ayo Sekolah Di SSRI",
  ),
  RatingModel(
    userName: "Made Edi",
    userImage: "assets/icons/userIcon.jpeg", 
    rating: 5,
    comment: "Sekolah Di SSRI Aja",
  ),
  RatingModel(
    userName: "Pak Dek Yostaf",
    userImage: "assets/icons/userIcon.jpeg", 
    rating: 3,
    comment: "Terafiliasi Dengan Berbagai Perusahan Dan Kampus",
  ),
];
