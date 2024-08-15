import 'package:phtv_admin/apis/api_config.dart';

class AdminChartApi extends ApiConfig {
  AdminChartApi(
      {super.module = 'admin',
        required super.path,
        required super.method,
        super.isAuth = false});

  static final getChartData = AdminChartApi(path: '/employer_chart', method: RequestMethod.get);
  static final getProfile = AdminChartApi(path: '/employer_account', method: RequestMethod.get);
}