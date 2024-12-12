import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClientsRecord extends FirestoreRecord {
  ClientsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "store" field.
  DocumentReference? _store;
  DocumentReference? get store => _store;
  bool hasStore() => _store != null;

  // "client" field.
  DocumentReference? _client;
  DocumentReference? get client => _client;
  bool hasClient() => _client != null;

  // "clientStatus" field.
  ClientStatus? _clientStatus;
  ClientStatus? get clientStatus => _clientStatus;
  bool hasClientStatus() => _clientStatus != null;

  void _initializeFields() {
    _store = snapshotData['store'] as DocumentReference?;
    _client = snapshotData['client'] as DocumentReference?;
    _clientStatus = snapshotData['clientStatus'] is ClientStatus
        ? snapshotData['clientStatus']
        : deserializeEnum<ClientStatus>(snapshotData['clientStatus']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clients');

  static Stream<ClientsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClientsRecord.fromSnapshot(s));

  static Future<ClientsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClientsRecord.fromSnapshot(s));

  static ClientsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ClientsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClientsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClientsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClientsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClientsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClientsRecordData({
  DocumentReference? store,
  DocumentReference? client,
  ClientStatus? clientStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'store': store,
      'client': client,
      'clientStatus': clientStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClientsRecordDocumentEquality implements Equality<ClientsRecord> {
  const ClientsRecordDocumentEquality();

  @override
  bool equals(ClientsRecord? e1, ClientsRecord? e2) {
    return e1?.store == e2?.store &&
        e1?.client == e2?.client &&
        e1?.clientStatus == e2?.clientStatus;
  }

  @override
  int hash(ClientsRecord? e) =>
      const ListEquality().hash([e?.store, e?.client, e?.clientStatus]);

  @override
  bool isValidKey(Object? o) => o is ClientsRecord;
}
