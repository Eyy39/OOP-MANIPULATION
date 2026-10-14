enum Skill { FLUTTER, DART, OTHER }

class Employee {
  final String _name;
  final double _baseSalary;
  final int _yearsOfExperience;
  final List<Skill> _skills;
  final Address _address;

  Employee({required this._name, required this._baseSalary, required this._yearsOfExperience, required this._skills, required this._address} );

  Employee.mobileDeveloper({required this._name, this._baseSalary = 40000, required this._address, required this._yearsOfExperience, this._skills = const [Skill.FLUTTER, Skill.DART]});
  
  void printDetails() {
    print('Employee: $_name, Base Salary: \$${_baseSalary}, Years of experience: $_yearsOfExperience, Skill: $_skills, Address: ${_address.street}, ${_address.city}, Final Salary: \$${computeSalary()}');
  }

  String get getName{
    return _name;
  }
  double get getSalary{
    return _baseSalary;
  }
  int get getYearsOfExperience{
    return _yearsOfExperience;
  }
  List<Skill> get getSkills => _skills;
  Address get address => _address;
  
  double computeSalary(){
    double salary = getSalary;
    if(_yearsOfExperience > 0){
      salary += _yearsOfExperience * 2000;
    }
    for (Skill skill in _skills){
      switch(skill){
        case  Skill.FLUTTER:
            salary += 5000;
            break;
        case Skill.DART:
            salary += 3000;
            break;
        case Skill.OTHER:
            salary += 1000;
            break;
      }
    }
    
    return salary;
  }

}

class Address{
  final String _street;
  final String _city;
  final String _zipCode;

  const Address(this._street, this._city, this._zipCode);

  String get street => _street;
  String get city => _city;
  String get zipCode => _zipCode;
}

void main() {
  const address = Address('Street 1', 'Phnom Penh', '12000');
  var emp1 = Employee(name:'Sokea',baseSalary: 40000, yearsOfExperience: 2,skills: [Skill.DART], address: address,);
  emp1.printDetails();

  var emp2 = Employee.mobileDeveloper(name: 'Ronan', baseSalary: 45000, yearsOfExperience: 3, address: address,);
  emp2.printDetails();
}