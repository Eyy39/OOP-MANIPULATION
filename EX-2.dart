enum AccountType {saving, checking}
class BankAccount {
    // TODO
    String _accountId;
    String? accountNumber;
    String holderName;
    double _balance;
    List<AccountType>? accountType;

    BankAccount(this._accountId,this.holderName,{this.accountNumber,  this._balance = 0.0, this.accountType});
 
    double get balance => _balance;
    String get accountId => _accountId;

    void withdraw(double amount){
      if(amount <= 0){
        throw Exception("Withdrawal amount must be positive.");
      }
      if (amount > _balance){
        throw Exception("Insufficient balance for withdrawal");
      }
      _balance -= amount;
    }

    void credit(double amount){
      if(amount > 0 ){
        _balance += amount;
      }else {
        throw Exception("Deposit amount must be positive.");
      };
    }
}

class Bank {
    // TODO
    final String name;
    final String? bankId;
    final Map<String, BankAccount> _account = {};

    Bank({required this.name, this.bankId});
    BankAccount createAccount(int accountId, String holderName){
      String userId = accountId.toString();

      if(_account.containsKey(userId)){
        throw Exception('Account with ID $accountId already exists!');
      }

      var newAccount = BankAccount(userId, holderName);
      _account[userId]=newAccount;

      return newAccount;
    }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print('Balance: \$${ronanAccount.balance.toInt()}'); // Balance: $0
  ronanAccount.credit(100);
  print('Balance: \$${ronanAccount.balance.toInt()}'); // Balance: $100
  ronanAccount.withdraw(50);
  print('Balance: \$${ronanAccount.balance.toInt()}'); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
