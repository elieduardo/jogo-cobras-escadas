class EnumPosicao {
  double getPositionBotton(int test) {
    if (test <= 10) {
      return 0;
    } else if (test <= 20) {
      return 52;
    } else if (test <= 30) {
      return 104;
    } else if (test <= 40) {
      return 156;
    } else if (test <= 50) {
      return 208;
    } else if (test <= 60) {
      return 260;
    } else if (test <= 70) {
      return 312;
    } else if (test <= 80) {
      return 364;
    } else if (test <= 90) {
      return 416;
    }
    return 468;
  }

  double getPositionLeft(int test) {
    if (test == 1 || test == 20 || test == 21 || test == 40 || test == 41) {
      return 0;
    } else if (test <= 20) {
      return 52;
    } else if (test <= 30) {
      return 104;
    } else if (test <= 40) {
      return 156;
    } else if (test <= 50) {
      return 208;
    } else if (test <= 60) {
      return 260;
    } else if (test <= 70) {
      return 312;
    } else if (test <= 80) {
      return 364;
    } else if (test <= 90) {
      return 416;
    }
    return 468;
  }
}
