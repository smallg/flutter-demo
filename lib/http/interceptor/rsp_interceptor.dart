import 'package:dio/dio.dart';
import 'package:oktoast/oktoast.dart';

import '../base_model.dart';

class RspInterceptor extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      if (response.requestOptions.path.contains("apiv2/app/check")) {
        handler.next(response);
      } else {
        var rsp = BaseModel.fromJson(response.data);
        if (rsp.errorCode == 0) {
          if (rsp.data == null) {
            handler.next(
                Response(requestOptions: response.requestOptions, data: true));
          } else {
            handler.next(Response(
                requestOptions: response.requestOptions, data: rsp.data));
          }
        } else if (rsp.errorCode == -1001) {
          handler.reject(DioException(
              requestOptions: response.requestOptions, message: "未登录"));
          showToast("请先登录");
        } else {
          handler.reject(DioException(requestOptions: response.requestOptions));
        }
      }
    } else {
      handler.reject(DioException(requestOptions: response.requestOptions));
    }
  }
}
