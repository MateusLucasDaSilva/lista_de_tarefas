// ignore_for_file: public_member_api_docs, sort_constructors_first

class ResponseEntity<T> {
  final int? statusCode;
  final dynamic body;
  ResponseEntity({
    this.statusCode,
    this.body,
  });
}
