import 'dart:typed_data';

import 'package:test/test.dart';

import 'package:web3dart/contracts.dart';
import 'package:web3dart/crypto.dart';

import 'package:web3dart/web3dart.dart' show LengthTrackingByteSink;


void expectEncodes<T>(AbiType<T> type, T data, String encoded) {
  final buffer = LengthTrackingByteSink();
  type.encode(data, buffer);

  expect(bytesToHex(buffer.asBytes(), include0x: false), encoded);
}

ByteBuffer bufferFromHex(String hex) {
  return hexToBytes(hex).buffer;
}
