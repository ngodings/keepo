import '../crypto_model.dart';
import '../fiat_model.dart';

class Wallet {
  List<Fiat>? fiat;
  List<Crypto>? crypto;

  Wallet({List<Fiat>? fiat, List<Crypto>? crypto}) {
    if (fiat != null) {
      this.fiat = fiat;
    }
    if (crypto != null) {
      this.crypto = crypto;
    }
  }

  Wallet.fromJson(Map<String, dynamic> json) {
    if (json['fiat'] != null) {
      fiat = <Fiat>[];
      json['fiat'].forEach((v) {
        fiat!.add(Fiat.fromJson(v));
      });
    }
    if (json['crypto'] != null) {
      crypto = <Crypto>[];
      json['crypto'].forEach((v) {
        crypto!.add(Crypto.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (fiat != null) {
      data['fiat'] = fiat!.map((v) => v.toJson()).toList();
    }
    if (crypto != null) {
      data['crypto'] = crypto!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
