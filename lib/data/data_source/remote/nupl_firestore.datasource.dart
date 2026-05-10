import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvrv/entity/entity.dart';

/// NUPL 히스토리 Firestore 데이터소스
///
/// 컬렉션 구조:
///   nupl_history/{YYYY-MM-DD}
///     - date: Timestamp
///     - nupl: number
class NuplFirestoreDatasource {
  NuplFirestoreDatasource(this._firestore);

  final FirebaseFirestore _firestore;

  static const _collection = 'nupl_history';

  CollectionReference<Map<String, dynamic>> get _ref =>
      _firestore.collection(_collection);

  /// 가장 최근 NUPL 1건 조회
  Future<NuplData?> getLatest() async {
    final snapshot = await _ref
        .orderBy('date', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;
    return _fromDoc(snapshot.docs.first.data());
  }

  /// NUPL 히스토리 조회 (날짜 오름차순)
  ///
  /// [from] / [to] 가 null 이면 전체 범위 조회
  Future<List<NuplData>> getHistory({DateTime? from, DateTime? to}) async {
    Query<Map<String, dynamic>> query = _ref.orderBy('date');

    if (from != null) {
      query = query.where(
        'date',
        isGreaterThanOrEqualTo: Timestamp.fromDate(from),
      );
    }
    if (to != null) {
      query = query.where('date', isLessThanOrEqualTo: Timestamp.fromDate(to));
    }

    final snapshot = await query.get();
    return snapshot.docs.map((doc) => _fromDoc(doc.data())).toList();
  }

  NuplData _fromDoc(Map<String, dynamic> raw) {
    return NuplData(
      date: (raw['date'] as Timestamp).toDate(),
      nupl: (raw['nupl'] as num).toDouble(),
    );
  }
}
