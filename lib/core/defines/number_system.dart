enum NumberSystem {
  hex(16),
  dec(10),
  oct(8),
  bin(2);

  final int base;
  const NumberSystem(this.base);
}
