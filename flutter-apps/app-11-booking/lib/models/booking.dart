class Booking {
  final String? id;
  final String customerName;
  final String email;
  final String phone;
  final String service;
  final DateTime bookingDate;
  final String bookingTime;
  final String status;
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Booking({
    this.id,
    required this.customerName,
    required this.email,
    required this.phone,
    required this.service,
    required this.bookingDate,
    required this.bookingTime,
    this.status = 'pending',
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['_id'],
      customerName: json['customerName'],
      email: json['email'],
      phone: json['phone'],
      service: json['service'],
      bookingDate: DateTime.parse(json['bookingDate']),
      bookingTime: json['bookingTime'],
      status: json['status'] ?? 'pending',
      notes: json['notes'],
      createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt: json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) '_id': id,
      'customerName': customerName,
      'email': email,
      'phone': phone,
      'service': service,
      'bookingDate': bookingDate.toIso8601String(),
      'bookingTime': bookingTime,
      'status': status,
      if (notes != null) 'notes': notes,
    };
  }

  Booking copyWith({
    String? id,
    String? customerName,
    String? email,
    String? phone,
    String? service,
    DateTime? bookingDate,
    String? bookingTime,
    String? status,
    String? notes,
  }) {
    return Booking(
      id: id ?? this.id,
      customerName: customerName ?? this.customerName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      service: service ?? this.service,
      bookingDate: bookingDate ?? this.bookingDate,
      bookingTime: bookingTime ?? this.bookingTime,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      createdAt: this.createdAt,
      updatedAt: this.updatedAt,
    );
  }
}
