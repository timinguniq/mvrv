import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mvrv/entity/entity.dart';

/// MVRV Z-Score 히스토리 Firestore 데이터소스
///
/// 컬렉션 구조:
///   mvrv_z_history/{YYYY-MM-DD}
///     - date: Timestamp
///     - mvrvZscore: number
class MvrvFirestoreDatasource {
  MvrvFirestoreDatasource(this._firestore);

  final FirebaseFirestore _firestore;

  static const _collection = 'mvrv_z_history';

  CollectionReference<Map<String, dynamic>> get _ref =>
      _firestore.collection(_collection);

  /// 가장 최근 MVRV Z-Score 1건 조회
  Future<MvrvData?> getLatest() async {
    final snapshot = await _ref
        .orderBy('date', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return null;
    return _fromDoc(snapshot.docs.first.data());
  }

  /// MVRV Z-Score 히스토리 조회 (날짜 오름차순)
  ///
  /// [from] / [to] 가 null 이면 전체 범위 조회
  Future<List<MvrvData>> getHistory({DateTime? from, DateTime? to}) async {
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

  MvrvData _fromDoc(Map<String, dynamic> raw) {
    return MvrvData(
      date: (raw['date'] as Timestamp).toDate(),
      mvrvZscore: (raw['mvrvZscore'] as num).toDouble(),
    );
  }
}
