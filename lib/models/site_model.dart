class Site {
  final String id;
  final String name;
  final String location;
  final String manager;
  final String status;

  Site({
    required this.id,
    required this.name,
    required this.location,
    required this.manager,
    required this.status,
  });

  Site copyWith({
    String? id,
    String? name,
    String? location,
    String? manager,
    String? status,
  }) {
    return Site(
      id: id ?? this.id,
      name: name ?? this.name,
      location: location ?? this.location,
      manager: manager ?? this.manager,
      status: status ?? this.status,
    );
  }

  factory Site.fromJson(Map<String, dynamic> json) {
    return Site(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      manager: json['manager'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'manager': manager,
      'status': status,
    };
  }

  bool get isActive => status.toLowerCase() == 'active';
}
