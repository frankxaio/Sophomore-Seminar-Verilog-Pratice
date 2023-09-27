#include <bits/stdc++.h>

using namespace std;

void read_pattern(int);

vector<int> x_list(40), y_list(40);
vector<int> p1_list(40), p2_list(40);
int x = 0, y = 0, x1_best = 0, y1_best = 0, x2 = 0, y2 = 0, x2_best = 0, y2_best = 0, cnt = 0, abs_x = 0, abs_y = 0;
int cs, ns;
int c1_covered = 0, c1_covered_nxt = 0;
int c2_covered;
int cnt2;

enum {
  INPUT,
  FIND,
  CHECK,
  DONE
};

int main() {
  read_pattern(1);

  // for (int i = 0; i < 40; i++) {
  //   cout << x_list[i] << " " << y_list[i];
  //   cout << endl;
  // }

  for (int i = 0; i < 40; i++) {
    p1_list[i] = 0;
  }

  x1_best = 1, x2_best = 2, y1_best = 3, y2_best = 4;

  while ((x1_best != x2_best) || (y1_best != y2_best)) {
    cnt = 0;
    x2_best = x2;
    y2_best = y2;
    x2 = x1_best;
    y2 = y1_best;
    c2_covered = c1_covered;
    c1_covered = 0;
    for (int i = 0; i < 40; i++) {
      p2_list[i] = p1_list[i];
    }

    if (cnt2 == 1) {
      break;
    }
    cnt2++;

    while (cnt <= 225) {
      // cout << abs_x << " " << abs_y << endl;
      cout << c1_covered << endl;
      for (int i = 0; i < 40; i = i + 1) {
        abs_x = abs(x - x_list[i]);
        abs_y = abs(y - y_list[i]);
        if (((abs_x + abs_y) <= 4) || (abs_x == 2 && abs_y == 3) || (abs_x == 3 && abs_y == 2)) {
          p1_list[i] = 1;
        }
        if ((p2_list[i] == 0) && (p1_list[i] == 1)) {
          c1_covered_nxt++;
        }
      }
      if (c1_covered <= c1_covered_nxt) {
        x1_best = x;
        y1_best = y;
        c1_covered = c1_covered_nxt;
        c1_covered_nxt = 0;
      }

      x++;
      if (x == 16) {
        if (y == 16) {
          y = 0;
        }
        y++;
        x = 0;
      }
      cnt++;
    }
    // cout << x1_best << " " << y1_best << endl;
  }
}

void read_pattern(int pattern) {
  switch (pattern) {
    case 1:
      freopen("img1.pattern", "r", stdin);
      break;
    case 2:
      freopen("img2.pattern", "r", stdin);
      break;
    case 3:
      freopen("img3.pattern", "r", stdin);
      break;
    case 4:
      freopen("img4.pattern", "r", stdin);
      break;
    case 5:
      freopen("img5.pattern", "r", stdin);
      break;
    case 6:
      freopen("img6.pattern", "r", stdin);
      break;
  }

  for (int i = 0; i < 40; i++) {
    cin >> x_list[i] >> y_list[i];
  }
}
