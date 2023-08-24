// СТРУКТУРА ДЛЯ ГРУЗОВ
class Transits {
  Transits({
    required this.batch,
    required this.destination,
    required this.numberClient,
    required this.statusInfo,
    required this.id,
    required this.fullInfo,
    required this.weight,
    required this.dopSum,
  });
  final String id;
  final String? batch;
  final String destination;
  final String numberClient;
  final Map statusInfo;
  final FullInfo fullInfo;
  final double dopSum;
  final double weight;

  factory Transits.fromJson(Map<String, dynamic> JsonMap) {
    final batch =
    (JsonMap['batch'] != null) ? (JsonMap['batch']) as String : 'no batch';
    final destination = (JsonMap['destination'] != null)
        ? (JsonMap['destination']) as String
        : 'no destination';
    final numberClient = (JsonMap['number_client'] != null)
        ? (JsonMap['number_client']) as String
        : 'no number';
    final statusInfo = (JsonMap['status_info'] != null)
        ? (JsonMap['status_info']) as Map<String, dynamic>
        : {'status': 'nostatus'};
    final id = JsonMap['id'];
    final fullInfo = (JsonMap['full_info'] != null)
        ? (FullInfo.fromJson(JsonMap['full_info']))
        : FullInfo.fromJson({'info': 'noInfo'} as Map<String, dynamic>);
    final weight =
    (JsonMap['weight_b'] != null) ? (JsonMap['weight_b']) as double : 0.0;
    final dopSum =
    (JsonMap['dop_sum'] != null) ? (JsonMap['dop_sum']).toDouble() : 0.0;

    return Transits(
      weight: weight,
      fullInfo: fullInfo,
      dopSum: dopSum,
      id: id,
      batch: batch,
      destination: destination,
      numberClient: numberClient,
      statusInfo: statusInfo,
    );
  }
}

class FullInfo {
  FullInfo({
    required this.countPlaces,
    required this.volume,
    required this.density,
    required this.docs,
  });
  final int countPlaces;
  final String volume;
  final double density;
  final Map docs;

  factory FullInfo.fromJson(Map<String, dynamic> JsonMap) {
    final countPlaces = (JsonMap['count_places'] != null)
        ? (JsonMap['count_places']) as int
        : 0;
    final volume =
    (JsonMap['volume'] != null) ? (JsonMap['volume']) as String : '0.0';
    final density =
    (JsonMap['density'] != null) ? (JsonMap['density']) as double : 0.0;
    final docs = ((JsonMap['account_document'] != null) &&
        (JsonMap['account_document'] != ''))
        ? (JsonMap['account_document']) as Map<String, dynamic>
        : {'name': 'no file'};
    ;

    return FullInfo(
      docs: docs,
      countPlaces: countPlaces,
      volume: volume,
      density: density,
    );
  }
}

