class User {
  String _pName;
  String _pSex;
  String _pAge;
  String _pID;
  String _pEmail;
  String _pPassword;

  User.create(this._pName, this._pSex, this._pAge, this._pID, this._pEmail,
      this._pPassword);

  User();

  String get pPassword => _pPassword;

  set pPassword(String value) {
    _pPassword = value;
  }

  String get pEmail => _pEmail;

  set pEmail(String value) {
    _pEmail = value;
  }

  String get pID => _pID;

  set pID(String value) {
    _pID = value;
  }

  String get pAge => _pAge;

  set pAge(String value) {
    _pAge = value;
  }

  String get pSex => _pSex;

  set pSex(String value) {
    _pSex = value;
  }

  String get pName => _pName;

  set pName(String value) {
    _pName = value;
  }
}
