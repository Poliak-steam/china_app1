// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transit_col.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTransitCollection on Isar {
  IsarCollection<Transit> get transits => this.collection();
}

const TransitSchema = CollectionSchema(
  name: r'Transit',
  id: 3905874010447936776,
  properties: {
    r'batch': PropertySchema(
      id: 0,
      name: r'batch',
      type: IsarType.string,
    ),
    r'countPlaces': PropertySchema(
      id: 1,
      name: r'countPlaces',
      type: IsarType.long,
    ),
    r'density': PropertySchema(
      id: 2,
      name: r'density',
      type: IsarType.double,
    ),
    r'destination': PropertySchema(
      id: 3,
      name: r'destination',
      type: IsarType.string,
    ),
    r'dopSum': PropertySchema(
      id: 4,
      name: r'dopSum',
      type: IsarType.double,
    ),
    r'numberClient': PropertySchema(
      id: 5,
      name: r'numberClient',
      type: IsarType.string,
    ),
    r'volume': PropertySchema(
      id: 6,
      name: r'volume',
      type: IsarType.string,
    ),
    r'weight': PropertySchema(
      id: 7,
      name: r'weight',
      type: IsarType.double,
    )
  },
  estimateSize: _transitEstimateSize,
  serialize: _transitSerialize,
  deserialize: _transitDeserialize,
  deserializeProp: _transitDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'docs': LinkSchema(
      id: -113883145968692161,
      name: r'docs',
      target: r'Docs',
      single: true,
    ),
    r'statusInfo': LinkSchema(
      id: 95695503274266258,
      name: r'statusInfo',
      target: r'StatusInfo',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _transitGetId,
  getLinks: _transitGetLinks,
  attach: _transitAttach,
  version: '3.1.0+1',
);

int _transitEstimateSize(
  Transit object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.batch.length * 3;
  bytesCount += 3 + object.destination.length * 3;
  bytesCount += 3 + object.numberClient.length * 3;
  bytesCount += 3 + object.volume.length * 3;
  return bytesCount;
}

void _transitSerialize(
  Transit object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.batch);
  writer.writeLong(offsets[1], object.countPlaces);
  writer.writeDouble(offsets[2], object.density);
  writer.writeString(offsets[3], object.destination);
  writer.writeDouble(offsets[4], object.dopSum);
  writer.writeString(offsets[5], object.numberClient);
  writer.writeString(offsets[6], object.volume);
  writer.writeDouble(offsets[7], object.weight);
}

Transit _transitDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Transit();
  object.batch = reader.readString(offsets[0]);
  object.countPlaces = reader.readLong(offsets[1]);
  object.density = reader.readDouble(offsets[2]);
  object.destination = reader.readString(offsets[3]);
  object.dopSum = reader.readDouble(offsets[4]);
  object.id = id;
  object.numberClient = reader.readString(offsets[5]);
  object.volume = reader.readString(offsets[6]);
  object.weight = reader.readDouble(offsets[7]);
  return object;
}

P _transitDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _transitGetId(Transit object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _transitGetLinks(Transit object) {
  return [object.docs, object.statusInfo];
}

void _transitAttach(IsarCollection<dynamic> col, Id id, Transit object) {
  object.id = id;
  object.docs.attach(col, col.isar.collection<Docs>(), r'docs', id);
  object.statusInfo
      .attach(col, col.isar.collection<StatusInfo>(), r'statusInfo', id);
}

extension TransitQueryWhereSort on QueryBuilder<Transit, Transit, QWhere> {
  QueryBuilder<Transit, Transit, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TransitQueryWhere on QueryBuilder<Transit, Transit, QWhereClause> {
  QueryBuilder<Transit, Transit, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Transit, Transit, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Transit, Transit, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Transit, Transit, QAfterWhereClause> idBetween(
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

extension TransitQueryFilter
    on QueryBuilder<Transit, Transit, QFilterCondition> {
  QueryBuilder<Transit, Transit, QAfterFilterCondition> batchEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> batchGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'batch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> batchLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'batch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> batchBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'batch',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> batchStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'batch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> batchEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'batch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> batchContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'batch',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> batchMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'batch',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> batchIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'batch',
        value: '',
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> batchIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'batch',
        value: '',
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> countPlacesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'countPlaces',
        value: value,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> countPlacesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'countPlaces',
        value: value,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> countPlacesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'countPlaces',
        value: value,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> countPlacesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'countPlaces',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> densityEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'density',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> densityGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'density',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> densityLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'density',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> densityBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'density',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> destinationEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> destinationGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> destinationLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> destinationBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'destination',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> destinationStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> destinationEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> destinationContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'destination',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> destinationMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'destination',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> destinationIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'destination',
        value: '',
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition>
      destinationIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'destination',
        value: '',
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> dopSumEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dopSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> dopSumGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'dopSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> dopSumLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'dopSum',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> dopSumBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'dopSum',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Transit, Transit, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Transit, Transit, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Transit, Transit, QAfterFilterCondition> numberClientEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numberClient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> numberClientGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'numberClient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> numberClientLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'numberClient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> numberClientBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'numberClient',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> numberClientStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'numberClient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> numberClientEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'numberClient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> numberClientContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'numberClient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> numberClientMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'numberClient',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> numberClientIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'numberClient',
        value: '',
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition>
      numberClientIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'numberClient',
        value: '',
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> volumeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> volumeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> volumeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> volumeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'volume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> volumeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> volumeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> volumeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'volume',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> volumeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'volume',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> volumeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'volume',
        value: '',
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> volumeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'volume',
        value: '',
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> weightEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> weightGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> weightLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'weight',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> weightBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'weight',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension TransitQueryObject
    on QueryBuilder<Transit, Transit, QFilterCondition> {}

extension TransitQueryLinks
    on QueryBuilder<Transit, Transit, QFilterCondition> {
  QueryBuilder<Transit, Transit, QAfterFilterCondition> docs(
      FilterQuery<Docs> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'docs');
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> docsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'docs', 0, true, 0, true);
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> statusInfo(
      FilterQuery<StatusInfo> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'statusInfo');
    });
  }

  QueryBuilder<Transit, Transit, QAfterFilterCondition> statusInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'statusInfo', 0, true, 0, true);
    });
  }
}

extension TransitQuerySortBy on QueryBuilder<Transit, Transit, QSortBy> {
  QueryBuilder<Transit, Transit, QAfterSortBy> sortByBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batch', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batch', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByCountPlaces() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countPlaces', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByCountPlacesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countPlaces', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByDensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'density', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByDensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'density', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByDestination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByDestinationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByDopSum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dopSum', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByDopSumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dopSum', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByNumberClient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberClient', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByNumberClientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberClient', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> sortByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension TransitQuerySortThenBy
    on QueryBuilder<Transit, Transit, QSortThenBy> {
  QueryBuilder<Transit, Transit, QAfterSortBy> thenByBatch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batch', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByBatchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'batch', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByCountPlaces() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countPlaces', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByCountPlacesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'countPlaces', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByDensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'density', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByDensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'density', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByDestination() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByDestinationDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'destination', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByDopSum() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dopSum', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByDopSumDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dopSum', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByNumberClient() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberClient', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByNumberClientDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'numberClient', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'volume', Sort.desc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.asc);
    });
  }

  QueryBuilder<Transit, Transit, QAfterSortBy> thenByWeightDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weight', Sort.desc);
    });
  }
}

extension TransitQueryWhereDistinct
    on QueryBuilder<Transit, Transit, QDistinct> {
  QueryBuilder<Transit, Transit, QDistinct> distinctByBatch(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'batch', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transit, Transit, QDistinct> distinctByCountPlaces() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'countPlaces');
    });
  }

  QueryBuilder<Transit, Transit, QDistinct> distinctByDensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'density');
    });
  }

  QueryBuilder<Transit, Transit, QDistinct> distinctByDestination(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'destination', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transit, Transit, QDistinct> distinctByDopSum() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dopSum');
    });
  }

  QueryBuilder<Transit, Transit, QDistinct> distinctByNumberClient(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'numberClient', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transit, Transit, QDistinct> distinctByVolume(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'volume', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Transit, Transit, QDistinct> distinctByWeight() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weight');
    });
  }
}

extension TransitQueryProperty
    on QueryBuilder<Transit, Transit, QQueryProperty> {
  QueryBuilder<Transit, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Transit, String, QQueryOperations> batchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'batch');
    });
  }

  QueryBuilder<Transit, int, QQueryOperations> countPlacesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'countPlaces');
    });
  }

  QueryBuilder<Transit, double, QQueryOperations> densityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'density');
    });
  }

  QueryBuilder<Transit, String, QQueryOperations> destinationProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'destination');
    });
  }

  QueryBuilder<Transit, double, QQueryOperations> dopSumProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dopSum');
    });
  }

  QueryBuilder<Transit, String, QQueryOperations> numberClientProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'numberClient');
    });
  }

  QueryBuilder<Transit, String, QQueryOperations> volumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'volume');
    });
  }

  QueryBuilder<Transit, double, QQueryOperations> weightProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weight');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDocsCollection on Isar {
  IsarCollection<Docs> get docs => this.collection();
}

const DocsSchema = CollectionSchema(
  name: r'Docs',
  id: -1113286567474454,
  properties: {
    r'name': PropertySchema(
      id: 0,
      name: r'name',
      type: IsarType.string,
    )
  },
  estimateSize: _docsEstimateSize,
  serialize: _docsSerialize,
  deserialize: _docsDeserialize,
  deserializeProp: _docsDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _docsGetId,
  getLinks: _docsGetLinks,
  attach: _docsAttach,
  version: '3.1.0+1',
);

int _docsEstimateSize(
  Docs object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.name.length * 3;
  return bytesCount;
}

void _docsSerialize(
  Docs object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.name);
}

Docs _docsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Docs();
  object.id = id;
  object.name = reader.readString(offsets[0]);
  return object;
}

P _docsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _docsGetId(Docs object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _docsGetLinks(Docs object) {
  return [];
}

void _docsAttach(IsarCollection<dynamic> col, Id id, Docs object) {
  object.id = id;
}

extension DocsQueryWhereSort on QueryBuilder<Docs, Docs, QWhere> {
  QueryBuilder<Docs, Docs, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DocsQueryWhere on QueryBuilder<Docs, Docs, QWhereClause> {
  QueryBuilder<Docs, Docs, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Docs, Docs, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Docs, Docs, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Docs, Docs, QAfterWhereClause> idBetween(
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

extension DocsQueryFilter on QueryBuilder<Docs, Docs, QFilterCondition> {
  QueryBuilder<Docs, Docs, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Docs, Docs, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Docs, Docs, QAfterFilterCondition> idBetween(
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

  QueryBuilder<Docs, Docs, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Docs, Docs, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }
}

extension DocsQueryObject on QueryBuilder<Docs, Docs, QFilterCondition> {}

extension DocsQueryLinks on QueryBuilder<Docs, Docs, QFilterCondition> {}

extension DocsQuerySortBy on QueryBuilder<Docs, Docs, QSortBy> {
  QueryBuilder<Docs, Docs, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Docs, Docs, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DocsQuerySortThenBy on QueryBuilder<Docs, Docs, QSortThenBy> {
  QueryBuilder<Docs, Docs, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Docs, Docs, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Docs, Docs, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Docs, Docs, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }
}

extension DocsQueryWhereDistinct on QueryBuilder<Docs, Docs, QDistinct> {
  QueryBuilder<Docs, Docs, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }
}

extension DocsQueryProperty on QueryBuilder<Docs, Docs, QQueryProperty> {
  QueryBuilder<Docs, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Docs, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStatusInfoCollection on Isar {
  IsarCollection<StatusInfo> get statusInfos => this.collection();
}

const StatusInfoSchema = CollectionSchema(
  name: r'StatusInfo',
  id: -3546428462213922748,
  properties: {
    r'statusDate': PropertySchema(
      id: 0,
      name: r'statusDate',
      type: IsarType.string,
    ),
    r'statusName': PropertySchema(
      id: 1,
      name: r'statusName',
      type: IsarType.string,
    )
  },
  estimateSize: _statusInfoEstimateSize,
  serialize: _statusInfoSerialize,
  deserialize: _statusInfoDeserialize,
  deserializeProp: _statusInfoDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _statusInfoGetId,
  getLinks: _statusInfoGetLinks,
  attach: _statusInfoAttach,
  version: '3.1.0+1',
);

int _statusInfoEstimateSize(
  StatusInfo object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.statusDate.length * 3;
  bytesCount += 3 + object.statusName.length * 3;
  return bytesCount;
}

void _statusInfoSerialize(
  StatusInfo object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.statusDate);
  writer.writeString(offsets[1], object.statusName);
}

StatusInfo _statusInfoDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StatusInfo();
  object.id = id;
  object.statusDate = reader.readString(offsets[0]);
  object.statusName = reader.readString(offsets[1]);
  return object;
}

P _statusInfoDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _statusInfoGetId(StatusInfo object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _statusInfoGetLinks(StatusInfo object) {
  return [];
}

void _statusInfoAttach(IsarCollection<dynamic> col, Id id, StatusInfo object) {
  object.id = id;
}

extension StatusInfoQueryWhereSort
    on QueryBuilder<StatusInfo, StatusInfo, QWhere> {
  QueryBuilder<StatusInfo, StatusInfo, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StatusInfoQueryWhere
    on QueryBuilder<StatusInfo, StatusInfo, QWhereClause> {
  QueryBuilder<StatusInfo, StatusInfo, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<StatusInfo, StatusInfo, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterWhereClause> idBetween(
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

extension StatusInfoQueryFilter
    on QueryBuilder<StatusInfo, StatusInfo, QFilterCondition> {
  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition> idBetween(
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

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition> statusDateEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusDateGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusDateLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition> statusDateBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusDateStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusDateEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusDateContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusDate',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition> statusDateMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusDate',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusDateIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusDate',
        value: '',
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusDateIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusDate',
        value: '',
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition> statusNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition> statusNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'statusName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'statusName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition> statusNameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'statusName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'statusName',
        value: '',
      ));
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterFilterCondition>
      statusNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'statusName',
        value: '',
      ));
    });
  }
}

extension StatusInfoQueryObject
    on QueryBuilder<StatusInfo, StatusInfo, QFilterCondition> {}

extension StatusInfoQueryLinks
    on QueryBuilder<StatusInfo, StatusInfo, QFilterCondition> {}

extension StatusInfoQuerySortBy
    on QueryBuilder<StatusInfo, StatusInfo, QSortBy> {
  QueryBuilder<StatusInfo, StatusInfo, QAfterSortBy> sortByStatusDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDate', Sort.asc);
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterSortBy> sortByStatusDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDate', Sort.desc);
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterSortBy> sortByStatusName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusName', Sort.asc);
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterSortBy> sortByStatusNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusName', Sort.desc);
    });
  }
}

extension StatusInfoQuerySortThenBy
    on QueryBuilder<StatusInfo, StatusInfo, QSortThenBy> {
  QueryBuilder<StatusInfo, StatusInfo, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterSortBy> thenByStatusDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDate', Sort.asc);
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterSortBy> thenByStatusDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDate', Sort.desc);
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterSortBy> thenByStatusName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusName', Sort.asc);
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QAfterSortBy> thenByStatusNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusName', Sort.desc);
    });
  }
}

extension StatusInfoQueryWhereDistinct
    on QueryBuilder<StatusInfo, StatusInfo, QDistinct> {
  QueryBuilder<StatusInfo, StatusInfo, QDistinct> distinctByStatusDate(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusDate', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StatusInfo, StatusInfo, QDistinct> distinctByStatusName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'statusName', caseSensitive: caseSensitive);
    });
  }
}

extension StatusInfoQueryProperty
    on QueryBuilder<StatusInfo, StatusInfo, QQueryProperty> {
  QueryBuilder<StatusInfo, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StatusInfo, String, QQueryOperations> statusDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusDate');
    });
  }

  QueryBuilder<StatusInfo, String, QQueryOperations> statusNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusName');
    });
  }
}
