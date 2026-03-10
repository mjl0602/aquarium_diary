extension SummaryIterableInt on Iterable<int> {
  Iterable<int> get _list => this.where((e) => e != 0);
  // 平均值
  int get avg => _list.isEmpty ? 0 : _list.sum ~/ _list.length;
  // 总和
  int get sum => _list.fold(0, (a, b) => a + b);
  // 最大值
  int get max => _list.isEmpty ? 0 : _list.reduce((a, b) => a > b ? a : b);
  // 最小值
  int get min => _list.isEmpty ? 0 : _list.reduce((a, b) => a < b ? a : b);
}

extension SummaryIterableDouble on Iterable<double> {
  Iterable<double> get _list => this.where((e) => e != 0);
  // 平均值
  int get avg => (_list.isEmpty ? 0 : _list.sum / _list.length).round();
  // 总和
  int get sum => (_list.fold(0.0, (a, b) => a + b)).round();
  // 最大值
  int get max =>
      (_list.isEmpty ? 0 : _list.reduce((a, b) => a > b ? a : b)).round();
  // 最小值
  int get min =>
      (_list.isEmpty ? 0 : _list.reduce((a, b) => a < b ? a : b)).round();

  // 平均值
  double get avgDouble =>
      (_list.isEmpty ? 0 : _list.sum / _list.length).toDouble();
  // 总和
  double get sumDouble => (_list.fold(0.0, (a, b) => a + b)).toDouble();
  // 最大值
  double get maxDouble =>
      (_list.isEmpty ? 0 : _list.reduce((a, b) => a > b ? a : b)).toDouble();
  // 最小值
  double get minDouble =>
      (_list.isEmpty ? 0 : _list.reduce((a, b) => a < b ? a : b)).toDouble();
}
