class AddRedeemPointsPostMdl {
  String? docDate;
  int? memberId;
  String? transType;
  String? dealerCode;
  double? debitAmount;
  // String? creditAmount;
  // String? balanceAmount;
  String? currency;
  // String? transRef;
  String? transIP;

  AddRedeemPointsPostMdl(
      {required this.debitAmount,
      // required this.balanceAmount,
      // required this.creditAmount,
      this.currency,
      required this.dealerCode,
      required this.docDate,
      required this.memberId,
      required this.transIP,
      // required this.transRef,
      this.transType});
  Map<String, dynamic> tojson() {
    Map<String, dynamic> redeemData = {
      "docDate": "$docDate",
      "memberId": memberId,
      // "balanceAmount": "$balanceAmount",
      "dealerCode": "$dealerCode",
      "debitAmount": debitAmount,
      // "creditAmount": "$creditAmount",
      "transIP": "$transIP",
      // "transRef": "$transRef",
      "transType": "Points_Redeem",
      "currency": "TZS",
    };
    return redeemData;
  }
}
//  "docDate": "2025-03-24T04:40:11.660Z",
//               "memberId": 878978,
//               "transType": "Points_Redeem",
//               "dealerCode": "D001",
//               "debitAmount": 100,
//               "creditAmount": 50,
//               "balanceAmount": 50,
//               "currency": "USD",
//               "transRef": "TXN123456789",
//               "transIP": "192.168.1.1"