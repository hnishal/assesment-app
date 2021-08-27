class Data {
  final List<Clients> clients;
  
  Data({
    required this.clients,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    var list = json['clients'] as List;
    List<Clients> clientsList = list.map((i) => Clients.fromJson(i)).toList();
    return Data(
      clients: clientsList,
    );
  }
}
class Clients{
  final String name;
  final String id;
  final String company;
  final String orderId;
  final String invoicepaid;
  final String invoicePending;

  Clients({ required this.name,required this.id,required this.company,required this.orderId,required this.invoicepaid,required this.invoicePending,});

  factory Clients.fromJson(Map<String, dynamic> json) {
    return Clients(
      name: json['name'],
      id: json['id'],
      company: json['company'],
      orderId: json['orderId'],
      invoicepaid: json['invoicepaid'],
      invoicePending: json['invoicePending'],
    );
  }
}