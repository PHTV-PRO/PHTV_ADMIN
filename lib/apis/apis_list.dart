import 'package:phtv_admin/apis/api_config.dart';

class AuthApi extends ApiConfig {
  AuthApi(
      {super.module = 'general',
        required super.path,
        required super.method,
        super.isAuth = false});

  static final login = AuthApi(path: '/login', method: RequestMethod.post);
  static final checkToken = AuthApi(path: '/check_token', method: RequestMethod.post);
}

class AdminChartApi extends ApiConfig {
  AdminChartApi(
      {super.module = 'admin',
        required super.path,
        required super.method,
        super.isAuth = false});

  static final getChartData = AdminChartApi(path: '/employer_chart', method: RequestMethod.get);
  static final getProfile = AdminChartApi(path: '/employer_account', method: RequestMethod.get);
  static final getJobs = AdminChartApi(path: '/employer_account', method: RequestMethod.get);
}

class AdminEmployerApi extends ApiConfig {
  AdminEmployerApi(
      {super.module = 'employer',
        required super.path,
        required super.method,
        super.isAuth = true});

  static final getJobs = AdminEmployerApi(path: '/account', method: RequestMethod.get);
}