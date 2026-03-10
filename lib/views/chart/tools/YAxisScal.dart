import 'dart:math';

class YAxisData {
  final double stepSize;
  final int gridCount;

  YAxisData(this.stepSize, this.gridCount);

  static YAxisData calculateYScale(double maxValue) {
    // 定义一个步长数组，包含可能的步长值
    List<double> possibleSteps = [2, 4, 6, 10, 15, 20, 50, 80, 100, 200, 1000];
    // 初始化步长和格子数
    double stepSize = 0;
    int gridCount = 0;
    double magnitude = 1;

    // 尝试不同的量级和步长，直到找到合适的格子数
    bool found = false;
    for (int mag = 0; mag <= 10 && !found; mag++) {
      magnitude = pow(10, mag).toDouble();
      for (double step in possibleSteps) {
        stepSize = step * magnitude;
        gridCount = (maxValue / stepSize).ceil();
        if (gridCount >= 2 && gridCount <= 5) {
          found = true; // 找到合适的步长和格子数，跳出循环
          break;
        }
      }
    }

    // 如果没有找到合适的格子数，强制设置为最接近的有效值
    if (!found) {
      stepSize = maxValue / 2; // 默认设置为2个格子
      gridCount = 2;
    }

    // 返回每一格的大小和格子数
    return YAxisData(
      stepSize,
      gridCount,
    );
  }
}
