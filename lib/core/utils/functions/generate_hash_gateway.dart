import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

String generateKashierOrderHash({
  required String amount,
  required String currency,
  required String merchantOrderId,
  String customerReference = '1',
}) {
  String secret = dotenv.get("USER_PUBLIC_PAYMENT_KEY");
  String mid = dotenv.get("MID");
  final String path =
      '/?payment=$mid.$merchantOrderId.$amount.$currency'
      '${customerReference.isNotEmpty ? '.$customerReference' : ''}';

  final hmacSha256 = Hmac(sha256, utf8.encode(secret));
  final digest = hmacSha256.convert(utf8.encode(path));

  return digest.toString();
}
