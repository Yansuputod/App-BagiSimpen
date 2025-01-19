
class RatingModel {
  final String userName;
  final String userImage; // URL gambar profil pengguna
  final int rating; // Jumlah bintang
  final String comment; // Komentar pengguna

  RatingModel({
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.comment,
  });
}

final List<RatingModel> ratings = [
  RatingModel(
    userName: "John Doe",
    userImage: "assets/icons/userIcon.jpeg", // URL Dummy
    rating: 4,
    comment: "Produk sangat bagus, sesuai dengan deskripsi!",
  ),
  RatingModel(
    userName: "Jane Smith",
    userImage: "assets/icons/userIcon.jpeg", // URL Dummy
    rating: 5,
    comment: "Kualitasnya sangat baik, pengiriman cepat.",
  ),
  RatingModel(
    userName: "Ali Baba",
    userImage: "assets/icons/userIcon.jpeg", // URL Dummy
    rating: 3,
    comment: "Cukup baik, tapi bisa lebih baik lagi.",
  ),
];
