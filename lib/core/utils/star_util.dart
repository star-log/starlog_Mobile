int starCountFromRank(int rank) => switch (rank) {
  1 => 5,
  2 || 3 => 4,
  4 || 5 || 6 || 7 => 3,
  8 || 9 || 10 || 11 => 2,
  _ => 1,
};