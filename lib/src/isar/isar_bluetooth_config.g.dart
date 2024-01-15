// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_bluetooth_config.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetIsarBluetoothConfigCollection on Isar {
  IsarCollection<IsarBluetoothConfig> get isarBluetoothConfigs =>
      this.collection();
}

const IsarBluetoothConfigSchema = CollectionSchema(
  name: r'IsarBluetoothConfig',
  id: 2573151655210068383,
  properties: {
    r'adapterState': PropertySchema(
      id: 0,
      name: r'adapterState',
      type: IsarType.byte,
      enumMap: _IsarBluetoothConfigadapterStateEnumValueMap,
    ),
    r'isScanningNow': PropertySchema(
      id: 1,
      name: r'isScanningNow',
      type: IsarType.bool,
    )
  },
  estimateSize: _isarBluetoothConfigEstimateSize,
  serialize: _isarBluetoothConfigSerialize,
  deserialize: _isarBluetoothConfigDeserialize,
  deserializeProp: _isarBluetoothConfigDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'systemDevices': LinkSchema(
      id: 783536616162488305,
      name: r'systemDevices',
      target: r'IsarBluetoothDevice',
      single: false,
      linkName: r'config',
    ),
    r'scanResults': LinkSchema(
      id: -7230737069462294903,
      name: r'scanResults',
      target: r'IsarScanResult',
      single: false,
      linkName: r'config',
    )
  },
  embeddedSchemas: {},
  getId: _isarBluetoothConfigGetId,
  getLinks: _isarBluetoothConfigGetLinks,
  attach: _isarBluetoothConfigAttach,
  version: '3.1.0+1',
);

int _isarBluetoothConfigEstimateSize(
  IsarBluetoothConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _isarBluetoothConfigSerialize(
  IsarBluetoothConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.adapterState.index);
  writer.writeBool(offsets[1], object.isScanningNow);
}

IsarBluetoothConfig _isarBluetoothConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IsarBluetoothConfig();
  object.adapterState = _IsarBluetoothConfigadapterStateValueEnumMap[
          reader.readByteOrNull(offsets[0])] ??
      UnlockdBluetoothAdapterState.unknown;
  object.id = id;
  object.isScanningNow = reader.readBool(offsets[1]);
  return object;
}

P _isarBluetoothConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_IsarBluetoothConfigadapterStateValueEnumMap[
              reader.readByteOrNull(offset)] ??
          UnlockdBluetoothAdapterState.unknown) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _IsarBluetoothConfigadapterStateEnumValueMap = {
  'unknown': 0,
  'unavailable': 1,
  'unauthorized': 2,
  'turningOn': 3,
  'on': 4,
  'turningOff': 5,
  'off': 6,
};
const _IsarBluetoothConfigadapterStateValueEnumMap = {
  0: UnlockdBluetoothAdapterState.unknown,
  1: UnlockdBluetoothAdapterState.unavailable,
  2: UnlockdBluetoothAdapterState.unauthorized,
  3: UnlockdBluetoothAdapterState.turningOn,
  4: UnlockdBluetoothAdapterState.on,
  5: UnlockdBluetoothAdapterState.turningOff,
  6: UnlockdBluetoothAdapterState.off,
};

Id _isarBluetoothConfigGetId(IsarBluetoothConfig object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _isarBluetoothConfigGetLinks(
    IsarBluetoothConfig object) {
  return [object.systemDevices, object.scanResults];
}

void _isarBluetoothConfigAttach(
    IsarCollection<dynamic> col, Id id, IsarBluetoothConfig object) {
  object.id = id;
  object.systemDevices.attach(
      col, col.isar.collection<IsarBluetoothDevice>(), r'systemDevices', id);
  object.scanResults
      .attach(col, col.isar.collection<IsarScanResult>(), r'scanResults', id);
}

extension IsarBluetoothConfigQueryWhereSort
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QWhere> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension IsarBluetoothConfigQueryWhere
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QWhereClause> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhereClause>
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

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterWhereClause>
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

extension IsarBluetoothConfigQueryFilter on QueryBuilder<IsarBluetoothConfig,
    IsarBluetoothConfig, QFilterCondition> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      adapterStateEqualTo(UnlockdBluetoothAdapterState value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adapterState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      adapterStateGreaterThan(
    UnlockdBluetoothAdapterState value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'adapterState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      adapterStateLessThan(
    UnlockdBluetoothAdapterState value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'adapterState',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      adapterStateBetween(
    UnlockdBluetoothAdapterState lower,
    UnlockdBluetoothAdapterState upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'adapterState',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
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

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
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

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
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

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      isScanningNowEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isScanningNow',
        value: value,
      ));
    });
  }
}

extension IsarBluetoothConfigQueryObject on QueryBuilder<IsarBluetoothConfig,
    IsarBluetoothConfig, QFilterCondition> {}

extension IsarBluetoothConfigQueryLinks on QueryBuilder<IsarBluetoothConfig,
    IsarBluetoothConfig, QFilterCondition> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevices(FilterQuery<IsarBluetoothDevice> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'systemDevices');
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'systemDevices', length, true, length, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'systemDevices', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'systemDevices', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'systemDevices', 0, true, length, include);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'systemDevices', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      systemDevicesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'systemDevices', lower, includeLower, upper, includeUpper);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResults(FilterQuery<IsarScanResult> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'scanResults');
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'scanResults', length, true, length, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'scanResults', 0, true, 0, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'scanResults', 0, false, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'scanResults', 0, true, length, include);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'scanResults', length, include, 999999, true);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterFilterCondition>
      scanResultsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'scanResults', lower, includeLower, upper, includeUpper);
    });
  }
}

extension IsarBluetoothConfigQuerySortBy
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QSortBy> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      sortByAdapterState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adapterState', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      sortByAdapterStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adapterState', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      sortByIsScanningNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isScanningNow', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      sortByIsScanningNowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isScanningNow', Sort.desc);
    });
  }
}

extension IsarBluetoothConfigQuerySortThenBy
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QSortThenBy> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenByAdapterState() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adapterState', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenByAdapterStateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adapterState', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenByIsScanningNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isScanningNow', Sort.asc);
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QAfterSortBy>
      thenByIsScanningNowDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isScanningNow', Sort.desc);
    });
  }
}

extension IsarBluetoothConfigQueryWhereDistinct
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QDistinct> {
  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QDistinct>
      distinctByAdapterState() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adapterState');
    });
  }

  QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QDistinct>
      distinctByIsScanningNow() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isScanningNow');
    });
  }
}

extension IsarBluetoothConfigQueryProperty
    on QueryBuilder<IsarBluetoothConfig, IsarBluetoothConfig, QQueryProperty> {
  QueryBuilder<IsarBluetoothConfig, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<IsarBluetoothConfig, UnlockdBluetoothAdapterState,
      QQueryOperations> adapterStateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adapterState');
    });
  }

  QueryBuilder<IsarBluetoothConfig, bool, QQueryOperations>
      isScanningNowProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isScanningNow');
    });
  }
}
