class Tracking {
  String? id;
  String? date;
  String? status;
  String? title;
  double? money;

  Tracking({
    this.id,
    required this.date,
    required this.status,
    required this.title,
    required this.money,
  });

  factory Tracking.fromJson(Map<String, dynamic> json) {
    return Tracking(
      id: json['id']?.toString(),
      date: json['date'],
      status: json['status'],
      title: json['title'],
      money: (json['money'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'date': date, 'status': status, 'title': title, 'money': money};
  }
}

extension TrackingExtension on List<Tracking> {
  double get totalMoneyIn => where(
    (e) => e.status == 'deposit',
  ).fold(0.0, (sum, item) => sum + (item.money ?? 0));

  double get totalMoneyOut => where(
    (e) => e.status == 'withdraw',
  ).fold(0.0, (sum, item) => sum + (item.money ?? 0));

  double get totalBalance => totalMoneyIn - totalMoneyOut;
}
