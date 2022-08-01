class CategoryListResponse {
  bool? _isSuccess;
  String? _message;
  List<Result>? _result;

  CategoryListResponse(
      {bool? isSuccess, String? message, List<Result>? result}) {
    if (isSuccess != null) {
      this._isSuccess = isSuccess;
    }
    if (message != null) {
      this._message = message;
    }
    if (result != null) {
      this._result = result;
    }
  }

  bool? get isSuccess => _isSuccess;
  set isSuccess(bool? isSuccess) => _isSuccess = isSuccess;
  String? get message => _message;
  set message(String? message) => _message = message;
  List<Result>? get result => _result;
  set result(List<Result>? result) => _result = result;

  CategoryListResponse.fromJson(Map<String, dynamic> json) {
    _isSuccess = json['isSuccess'];
    _message = json['message'];
    if (json['result'] != null) {
      _result = <Result>[];
      json['result'].forEach((v) {
        _result!.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isSuccess'] = this._isSuccess;
    data['message'] = this._message;
    if (this._result != null) {
      data['result'] = this._result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  int? _id;
  String? _categoryName;
  String? _url;
  String? _status;

  Result({int? id, String? categoryName, String? url, String? status}) {
    if (id != null) {
      this._id = id;
    }
    if (categoryName != null) {
      this._categoryName = categoryName;
    }
    if (url != null) {
      this._url = url;
    }
    if (status != null) {
      this._status = status;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get categoryName => _categoryName;
  set categoryName(String? categoryName) => _categoryName = categoryName;
  String? get url => _url;
  set url(String? url) => _url = url;
  String? get status => _status;
  set status(String? status) => _status = status;

  Result.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _categoryName = json['category_name'];
    _url = json['url'];
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['category_name'] = this._categoryName;
    data['url'] = this._url;
    data['status'] = this._status;
    return data;
  }
}
