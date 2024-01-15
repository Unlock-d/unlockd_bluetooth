// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_bluetooth_device.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarBluetoothDeviceCollection on Isar {
  IsarCollection<IsarBluetoothDevice> get isarBluetoothDevices =>
      this.collection();
}

const IsarBluetoothDeviceSchema = CollectionSchema(
  name: r'IsarBluetoothDevice',
  id: -5441148380203195866,
  properties: {
    r'advName': PropertySchema(
      id: 0,
      name: r'advName',
      type: IsarType.string,
    ),
    r'isarConnectionState': PropertySchema(
      id: 1,
      name: r'isarConnectionState',
      type: IsarType.byte,
      enumMap: _IsarBluetoothDeviceisarConnectionStateEnumValueMap,
    ),
    r'mtuNow': PropertySchema(
      id: 2,
      name: r'mtuNow',
      type: IsarType.long,
    ),
    r'platformName': PropertySchema(
      id: 3,
      name: r'platformName',
      type: IsarType.string,
    ),
    r'remoteId': PropertySchema(
      id: 4,
      name: r'remoteId',
      type: IsarType.string,
    ),
    r'rssi': PropertySchema(
      id: 5,
      name: r'rssi',
      type: IsarType.long,
    )
  },
  estimateSize: _isarBluetoothDeviceEstimateSize,
  serialize: _isarBluetoothDeviceSerialize,
  deserialize: _isarBluetoothDeviceDeserialize,
  deserializeProp: _isarBluetoothDeviceDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'config': LinkSchema(
      id: -1767006862236188093,
      name: r'config',
      target: r'IsarBluetoothConfig',
      single: true,
    ),
    r'result': LinkSchema(
      id: 1185798061306918438,
      name: r'result',
      target: r'IsarScanResult',
      single: true,
      linkName: r'isarBluetoothDevice',
    ),
    r'isarBluetoothServices': LinkSchema(
      id: -8463776439203429377,
      name: r'isarBluetoothServices',
      target: r'IsarBluetoothService',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _isarBluetoothDeviceGetId,
  getLinks: _isarBluetoothDeviceGetLinks,
  attach: _isarBluetoothDeviceAttach,
  version: '3.1.0+1',
);

int _isarBluetoothDeviceEstimateSize(
  IsarBluetoothDevice object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.advName.length * 3;
  bytesCount += 3 + object.platformName.length * 3;
  bytesCount += 3 + object.remoteId.length * 3;
  return bytesCount;
}

void _isarBluetoothDeviceSerialize(
  IsarBluetoothDevice object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.advName);
  writer.writeByte(offsets[1], object.isarConnectionState.index);
  writer.writeLong(offsets[2], object.mtuNow);
  writer.writeString(offsets[3], object.platformName);
  writer.writeString(offsets[4], object.remoteId);
  writer.writeLong(offsets[5], object.rssi);
}

IsarBluetoothDevice _isarBluetoothDeviceDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBluetoothDevice();
  object.advName = reader.readString(offsets[0]);
  object.id = id;
  object.isarConnectionState =
      _IsarBluetoothDeviceisarConnectionStateValueEnumMap[
              reader.readByteOrNull(offsets[1])] ??
          UnlockdBluetoothConnectionState.disconnected;
  object.mtuNow = reader.readLong(offsets[2]);
  object.platformName = reader.readString(offsets[3]);
  object.remoteId = reader.readString(offsets[4]);
  object.rssi = reader.readLong(offsets[5]);
  return object;
}

P _isarBluetoothDeviceDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (_IsarBluetoothDeviceisarConnectionStateValueEnumMap[
              reader.readByteOrNull(offset)] ??
          UnlockdBluetoothConnectionState.disconnected) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarBluetoothDeviceisarConnectionStateEnumValueMap = {
  'disconnected': 0,
  'connected': 1,
};
const _IsarBluetoothDeviceisarConnectionStateValueEnumMap = {
  0: UnlockdBluetoothConnectionState.disconnected,
  1: UnlockdBluetoothConnectionState.connected,
};

Id _isarBluetoothDeviceGetId(IsarBluetoothDevice object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarBluetoothDeviceGetLinks(
    IsarBluetoothDevice object) {
  return [object.config, object.result, object.isarBluetoothServices];
}

void _isarBluetoothDeviceAttach(
    IsarCollection<dynamic> col, Id id, IsarBluetoothDevice object) {
  object.id = id;
  object.config
      .attach(col, col.isar.collection<IsarBluetoothConfig>(), r'config', id);
  object.result
      .attach(col, col.isar.collection<IsarScanResult>(), r'result', id);
  object.isarBluetoothServices.attach(
      col,
      col.isar.collection<IsarBluetoothService>(),
      r'isarBluetoothServices',
      id);
}

extension IsarBluetoothDeviceQueryWhereSort
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QWhere> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarBluetoothDeviceQueryWhere
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QWhereClause> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarBluetoothDeviceQueryFilter on QueryBuilder<IsarBluetoothDevice,
    IsarBluetoothDevice, QFilterCondition> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'advName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'advName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'advName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'advName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      advNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'advName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarConnectionStateEqualTo(UnlockdBluetoothConnectionState value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarConnectionState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarConnectionStateGreaterThan(
    UnlockdBluetoothConnectionState value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarConnectionState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarConnectionStateLessThan(
    UnlockdBluetoothConnectionState value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarConnectionState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarConnectionStateBetween(
    UnlockdBluetoothConnectionState lower,
    UnlockdBluetoothConnectionState upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarConnectionState',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      mtuNowEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mtuNow',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      mtuNowGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mtuNow',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      mtuNowLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mtuNow',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      mtuNowBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mtuNow',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'platformName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'platformName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'platformName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'platformName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      platformNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'platformName',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'remoteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'remoteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'remoteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      remoteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'remoteId',
        value: '',
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      rssiEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rssi',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      rssiGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rssi',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      rssiLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rssi',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      rssiBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rssi',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension IsarBluetoothDeviceQueryObject on QueryBuilder<IsarBluetoothDevice,
    IsarBluetoothDevice, QFilterCondition> {}

extension IsarBluetoothDeviceQueryLinks on QueryBuilder<IsarBluetoothDevice,
    IsarBluetoothDevice, QFilterCondition> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      config(FilterQuery<IsarBluetoothConfig> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'config');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      configIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'config', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      result(FilterQuery<IsarScanResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'result');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      resultIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'result', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServices(FilterQuery<IsarBluetoothService> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'isarBluetoothServices');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarBluetoothServices', length, true, length, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarBluetoothServices', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'isarBluetoothServices', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarBluetoothServices', 0, true, length, include);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarBluetoothServices', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterFilterCondition>
      isarBluetoothServicesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'isarBluetoothServices', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarBluetoothDeviceQuerySortBy
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QSortBy> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByAdvName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advName', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByAdvNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advName', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByIsarConnectionState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarConnectionState', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByIsarConnectionStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarConnectionState', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByMtuNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtuNow', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByMtuNowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtuNow', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByPlatformName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByPlatformNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByRssi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rssi', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      sortByRssiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rssi', Sort.desc);
    });
  }
}

extension IsarBluetoothDeviceQuerySortThenBy
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QSortThenBy> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByAdvName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advName', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByAdvNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'advName', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByIsarConnectionState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarConnectionState', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByIsarConnectionStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarConnectionState', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByMtuNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtuNow', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByMtuNowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mtuNow', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByPlatformName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByPlatformNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'platformName', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByRemoteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByRemoteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'remoteId', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByRssi() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rssi', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QAfterSortBy>
      thenByRssiDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rssi', Sort.desc);
    });
  }
}

extension IsarBluetoothDeviceQueryWhereDistinct
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct> {
  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByAdvName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'advName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByIsarConnectionState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isarConnectionState');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByMtuNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mtuNow');
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByPlatformName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'platformName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByRemoteId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'remoteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QDistinct>
      distinctByRssi() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rssi');
    });
  }
}

extension IsarBluetoothDeviceQueryProperty
    on QueryBuilder<IsarBluetoothDevice, IsarBluetoothDevice, QQueryProperty> {
  QueryBuilder<IsarBluetoothDevice, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarBluetoothDevice, String, QQueryOperations>
      advNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'advName');
    });
  }

  QueryBuilder<IsarBluetoothDevice, UnlockdBluetoothConnectionState,
      QQueryOperations> isarConnectionStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarConnectionState');
    });
  }

  QueryBuilder<IsarBluetoothDevice, int, QQueryOperations> mtuNowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mtuNow');
    });
  }

  QueryBuilder<IsarBluetoothDevice, String, QQueryOperations>
      platformNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'platformName');
    });
  }

  QueryBuilder<IsarBluetoothDevice, String, QQueryOperations>
      remoteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'remoteId');
    });
  }

  QueryBuilder<IsarBluetoothDevice, int, QQueryOperations> rssiProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rssi');
    });
  }
}
