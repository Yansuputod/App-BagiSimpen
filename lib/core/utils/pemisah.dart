class Pemisah {
  String rbSeparator(int number) {
    if (number >= 1000) {
      double formattedNumber = number / 1000;
      return "${formattedNumber.toStringAsFixed(1)}RB+";
    } else {
      return number.toString();
    }
  }

  String separator(int? number) {
    if (number == null) {
      return '0';
    }
    return number.toString().replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => '.',
        );
  }
}
