class Fact {
  final String fact;
  final int length;

  Fact({required this.fact, required this.length});

  factory Fact.fromJson(Map<String, dynamic> json) {
    return Fact(
      fact: json['fact'],
      length: json['length'],
    );
  }

  Map<String, dynamic> toJson() => {"fact": fact, "length": length};

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Fact && fact == other.fact && length == other.length;

  // ^ is the XOR operator
  @override
  int get hashCode => fact.hashCode ^ length.hashCode;
}
