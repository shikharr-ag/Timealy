class Helpers {
  String getFormattedTime(int val) {
    String v = val.toStringAsFixed(0);
    String x = '00:${v == '0' ? '00' : (val < 10 ? '0$v' : '$val')}\n';
    return x;
  }
}
