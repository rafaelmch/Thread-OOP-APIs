unit uInterfaceAnimal;

{
by Rafael Hassegawa
Animal Interface
}

interface

type
  //every implementation of the interface has to be in accordance to the contract
  IAnimal = interface
    ['{DE0AA219-025B-4987-8DBA-3BD3A1F7D811}']

    //when an interface is created, it is like creating a contract,
    //meaning that all of the methods have to be implemented.
    //if not, the app won't even compile
    Function Name : IAnimal;
    Function Age : IAnimal;
    Function Walks : IAnimal;

  end;

implementation

end.
