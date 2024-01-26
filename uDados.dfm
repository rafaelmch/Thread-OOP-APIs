object frmDados: TfrmDados
  OldCreateOrder = False
  Height = 460
  Width = 845
  object conexaoMySql: TFDConnection
    Params.Strings = (
      'Database=Desbravador_database'
      'User_Name=root'
      'Password=Rafa1982;'
      'Server=localhost'
      'DriverID=MySQL')
    Connected = True
    Left = 448
    Top = 24
  end
  object qGeral: TFDQuery
    Connection = conexaoMySql
    Left = 512
    Top = 24
  end
  object dsqGeral: TDataSource
    DataSet = qGeral
    Left = 576
    Top = 24
  end
  object qPessoa: TFDQuery
    Connection = conexaoMySql
    SQL.Strings = (
      'select * from pessoa')
    Left = 760
    Top = 24
  end
  object dsqPessoa: TDataSource
    DataSet = qPessoa
    Left = 688
    Top = 24
  end
  object qEndereco: TFDQuery
    Connection = conexaoMySql
    SQL.Strings = (
      'select * from endereco')
    Left = 760
    Top = 96
  end
  object dsqEndereco: TDataSource
    DataSet = qEndereco
    Left = 688
    Top = 96
  end
  object qEnderecoIntegracao: TFDQuery
    Connection = conexaoMySql
    SQL.Strings = (
      'select * from endereco_integracao')
    Left = 760
    Top = 176
  end
  object dsqEnderecoIntegracao: TDataSource
    DataSet = qEnderecoIntegracao
    Left = 672
    Top = 176
  end
end
