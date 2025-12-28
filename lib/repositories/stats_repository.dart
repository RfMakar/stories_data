import 'package:stories_data/data/rest_client.dart';
import 'package:stories_data/models/reads_stats_model.dart';

class StatsRepository {
  final RestClient _restClient;

  StatsRepository(this._restClient);

  Future<ReadsStatsModel> getReadsStats() async {
    final res = await _restClient.getReadsStats();
    return res;
  }
}
