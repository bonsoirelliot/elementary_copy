class BaseResponseModel {
  final dynamic data;

  final int count;

  final int totalPages;

  final String? nextPage;

  BaseResponseModel({
    required this.data,
    required this.count,
    required this.totalPages,
    this.nextPage,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> map) {
    return BaseResponseModel(
      data: map['data'],
      count: map['count'] as int,
      totalPages: map['totalPages'] as int,
      nextPage: map['nextPage'] as String?,
    );
  }
}
