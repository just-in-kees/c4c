
class Transaction {
  final String accountId;

  final double amount;

  final String categoryId;

  final String categoryType;

  final String credentialsId;

  final int date;

  final String description;

  final String formattedDescription;

  final String id;

  final int inserted;

  final Map internalPayload;

  final int lastModified;

  final String merchantId;

  final String notes;

  final double originalAmount;

  final int originalDate;

  final String originalDescription;

  final Map payload;

  final String MESSAGE;

  final String TRANSFER_ACCOUNT_NAME_EXTERNAL;

  final String DETAILS;

  final bool pending;

  final int timestamp;

  final String type;

  final String userId;

  final bool upcoming;

  final bool userModifiedAmount;

  final bool userModifiedCategory;

  final bool userModifiedDate;

  final bool userModifiedDescription;

  final bool userModifiedLocation;

  final Map currencyDenominatedAmount;

  final int unscaledValue;

  final int scale;

  final String currencyCode;

  final Map currencyDenominatedOriginalAmount;

  final List parts;

  final Map partnerPayload;

  final double dispensableAmount;

  final bool userModified;

  Transaction(
      {this.accountId,
        this.amount,
        this.categoryId,
        this.categoryType,
        this.credentialsId,
        this.date,
        this.description,
        this.formattedDescription,
        this.id,
        this.inserted,
        this.internalPayload,
        this.lastModified,
        this.merchantId,
        this.notes,
        this.originalAmount,
        this.originalDate,
        this.originalDescription,
        this.payload,
        this.MESSAGE,
        this.TRANSFER_ACCOUNT_NAME_EXTERNAL,
        this.DETAILS,
        this.pending,
        this.timestamp,
        this.type,
        this.userId,
        this.upcoming,
        this.userModifiedAmount,
        this.userModifiedCategory,
        this.userModifiedDate,
        this.userModifiedDescription,
        this.userModifiedLocation,
        this.currencyDenominatedAmount,
        this.unscaledValue,
        this.scale,
        this.currencyCode,
        this.currencyDenominatedOriginalAmount,
        this.parts,
        this.partnerPayload,
        this.dispensableAmount,
        this.userModified});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      accountId: json['accountId'],
      amount: json['amount'],
      categoryId: json['categoryId'],
      categoryType: json['categoryType'],
      credentialsId: json['credentialsId'],
      date: json['date'],
      description: json['description'],
      formattedDescription: json['formattedDescription'],
      id: json['id'],
      inserted: json['inserted'],
      internalPayload: json['internalPayload'],
      lastModified: json['lastModified'],
      merchantId: json['merchantId'],
      notes: json['notes'],
      originalAmount: json['originalAmount'],
      originalDate: json['originalDate'],
      originalDescription: json['originalDescription'],
      payload: json['payload'],
      MESSAGE: json['MESSAGE'],
      TRANSFER_ACCOUNT_NAME_EXTERNAL: json['TRANSFER_ACCOUNT_NAME_EXTERNAL'],
      DETAILS: json['DETAILS'],
      pending: json['pending'],
      timestamp: json['timestamp'],
      type: json['type'],
      userId: json['userId'],
      upcoming: json['upcoming'],
      userModifiedAmount: json['userModifiedAmount'],
      userModifiedCategory: json['userModifiedCategory'],
      userModifiedDate: json['userModifiedDate'],
      userModifiedDescription: json['userModifiedDescription'],
      userModifiedLocation: json['userModifiedLocation'],
      currencyDenominatedAmount: json['currencyDenominatedAmount'],
      unscaledValue: json['unscaledValue'],
      scale: json['scale'],
      currencyCode: json['currencyCode'],
      currencyDenominatedOriginalAmount:
      json['currencyDenominatedOriginalAmount'],
      parts: json['parts'],
      partnerPayload: json['partnerPayload'],
      dispensableAmount: json['dispensableAmount'],
      userModified: json['userModified'],
    );
  }
}

