import 'package:intl/intl.dart';

class FormatChanger {
  double koordinat(String input) {
    var f = NumberFormat("###.########", "en_US");
    return double.parse(f.format(double.parse(input)));
  }

  String separator(String input) {
    var f = NumberFormat("###,###,###,###");
    String hasil = f.format(int.parse(input.replaceAll(".0", "")));
    return hasil.replaceAll(",", ".");
  }

  String jam(String input) {
    var f = DateFormat('HH:mm');
    return f.format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(input.toString()));
  }

  String tanggalAPI(DateTime input) {
    var f = DateFormat('yyyy-MM-dd');
    return f.format(DateFormat('yyyy-MM-dd').parse(input.toString()));
  }

  String tanggalAPIString(String input) {
    var f = DateFormat('yyyy-MM-dd');
    return f.format(DateFormat('dd-MM-yyyy').parse(input)).toString();
  }

  String tanggalIndo(DateTime input) {
    var f = DateFormat('dd-MM-yyyy');
    return f.format(DateFormat('yyyy-MM-dd').parse(input.toString()));
  }
  //   String newtanggalIndo(DateTime input) {
  //   var f = DateFormat('dd-MM-yyyy');
  //   return f.format(DateFormat('yyyy-MM-dd').parse(input.toString()));
  // }

  String BulanIndo(DateTime input) {
    var f = DateFormat('MMMM yyyy');
    return f.format(DateFormat('yyyy-MM').parse(input.toString()));
  }

  String tanggalIndoFromString(String input) {
    var f = DateFormat('dd-MM-yyyy');
    return f.format(DateFormat('yyyy-MM-dd').parse(input.toString()));
  }

  String tanggalJam(DateTime input) {
    var f = DateFormat('dd-MM-yyyy HH:mm');
    return f.format(DateFormat('yyyy-MM-dd HH:mm:ss').parse(input.toString()));
  }
}
