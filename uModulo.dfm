object Modulo: TModulo
  Height = 328
  Width = 575
  object Conexao: TUniConnection
    ProviderName = 'MySQL'
    Port = 3306
    Database = 'dbsyssales35x'
    Username = 'root'
    Server = 'localhost'
    Connected = True
    Left = 32
    Top = 5
  end
  object Provider: TMySQLUniProvider
    Left = 91
    Top = 5
  end
  object Transacoes: TUniTransaction
    DefaultConnection = Conexao
    Left = 165
    Top = 5
  end
  object sqlOff: TUniSQL
    Connection = Conexao
    Left = 240
    Top = 5
  end
  object uqUsuarios: TUniQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from usuarios')
    Active = True
    OnCalcFields = uqUsuariosCalcFields
    Left = 75
    Top = 96
    object uqUsuariosUsuario_ID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'Usuario_ID'
    end
    object uqUsuariosNome: TStringField
      FieldName = 'Nome'
      Required = True
      Size = 50
    end
    object uqUsuariosSobrenome: TStringField
      FieldName = 'Sobrenome'
      Required = True
      Size = 50
    end
    object uqUsuarioseMail: TStringField
      FieldName = 'eMail'
      Required = True
      Size = 100
    end
    object uqUsuariosUsuario: TStringField
      FieldName = 'Usuario'
      Required = True
      Size = 32
    end
    object uqUsuariosSenha: TStringField
      FieldName = 'Senha'
      Required = True
      Size = 32
    end
    object uqUsuariosNivel_usuario: TStringField
      FieldName = 'Nivel_usuario'
      Required = True
      FixedChar = True
      Size = 1
    end
    object uqUsuariosDta_cadastro: TDateTimeField
      FieldName = 'Dta_cadastro'
      Required = True
    end
    object uqUsuariosDta_ultimo_login: TDateTimeField
      FieldName = 'Dta_ultimo_login'
      Required = True
    end
    object uqUsuariosAtivado: TStringField
      FieldName = 'Ativado'
      Required = True
      FixedChar = True
      Size = 1
    end
    object uqUsuariosNivelUser: TStringField
      FieldKind = fkCalculated
      FieldName = 'NivelUser'
      Calculated = True
    end
    object uqUsuariosStatusUser: TStringField
      FieldKind = fkCalculated
      FieldName = 'StatusUser'
      Calculated = True
    end
    object uqUsuariosInfo: TMemoField
      FieldName = 'Info'
      Required = True
      BlobType = ftMemo
    end
  end
  object udsUsuarios: TUniDataSource
    DataSet = uqUsuarios
    Left = 171
    Top = 96
  end
  object uqFornecedores: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO fornecedores'
      '  (CODFORN, NOME, CNPJ, RUA, BAIRRO, CIDADE, CEP, UF, FONE)'
      'VALUES'
      
        '  (:CODFORN, :NOME, :CNPJ, :RUA, :BAIRRO, :CIDADE, :CEP, :UF, :F' +
        'ONE)')
    SQLDelete.Strings = (
      'DELETE FROM fornecedores'
      'WHERE'
      '  CODFORN = :Old_CODFORN')
    SQLUpdate.Strings = (
      'UPDATE fornecedores'
      'SET'
      
        '  CODFORN = :CODFORN, NOME = :NOME, CNPJ = :CNPJ, RUA = :RUA, BA' +
        'IRRO = :BAIRRO, CIDADE = :CIDADE, CEP = :CEP, UF = :UF, FONE = :' +
        'FONE'
      'WHERE'
      '  CODFORN = :Old_CODFORN')
    SQLLock.Strings = (
      'SELECT * FROM fornecedores'
      'WHERE'
      '  CODFORN = :Old_CODFORN'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT CODFORN, NOME, CNPJ, RUA, BAIRRO, CIDADE, CEP, UF, FONE F' +
        'ROM fornecedores'
      'WHERE'
      '  CODFORN = :CODFORN')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM fornecedores')
    Connection = Conexao
    SQL.Strings = (
      'select * from fornecedores')
    Active = True
    Left = 73
    Top = 248
    object uqFornecedoresCODFORN: TIntegerField
      FieldName = 'CODFORN'
      Required = True
    end
    object uqFornecedoresNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 100
    end
    object uqFornecedoresCNPJ: TStringField
      FieldName = 'CNPJ'
      Required = True
      FixedChar = True
      Size = 14
    end
    object uqFornecedoresRUA: TStringField
      FieldName = 'RUA'
      Size = 100
    end
    object uqFornecedoresBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 100
    end
    object uqFornecedoresCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 100
    end
    object uqFornecedoresCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object uqFornecedoresUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object uqFornecedoresFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
  end
  object udsFornecedores: TUniDataSource
    DataSet = uqFornecedores
    Left = 177
    Top = 248
  end
  object uqClientes: TUniQuery
    SQLInsert.Strings = (
      'INSERT INTO fornecedores'
      '  (CODFORN, NOME, CNPJ, RUA, BAIRRO, CIDADE, CEP, UF, FONE)'
      'VALUES'
      
        '  (:CODFORN, :NOME, :CNPJ, :RUA, :BAIRRO, :CIDADE, :CEP, :UF, :F' +
        'ONE)')
    SQLDelete.Strings = (
      'DELETE FROM fornecedores'
      'WHERE'
      '  CODFORN = :Old_CODFORN')
    SQLUpdate.Strings = (
      'UPDATE fornecedores'
      'SET'
      
        '  CODFORN = :CODFORN, NOME = :NOME, CNPJ = :CNPJ, RUA = :RUA, BA' +
        'IRRO = :BAIRRO, CIDADE = :CIDADE, CEP = :CEP, UF = :UF, FONE = :' +
        'FONE'
      'WHERE'
      '  CODFORN = :Old_CODFORN')
    SQLLock.Strings = (
      'SELECT * FROM fornecedores'
      'WHERE'
      '  CODFORN = :Old_CODFORN'
      'FOR UPDATE')
    SQLRefresh.Strings = (
      
        'SELECT CODFORN, NOME, CNPJ, RUA, BAIRRO, CIDADE, CEP, UF, FONE F' +
        'ROM fornecedores'
      'WHERE'
      '  CODFORN = :CODFORN')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM fornecedores')
    Connection = Conexao
    SQL.Strings = (
      'select * from clientes'
      '')
    Active = True
    Left = 81
    Top = 168
    object uqClientesCODCLI: TIntegerField
      FieldName = 'CODCLI'
      Required = True
    end
    object uqClientesNOME: TStringField
      FieldName = 'NOME'
      Required = True
      Size = 40
    end
    object uqClientesCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Required = True
      FixedChar = True
      Size = 14
    end
    object uqClientesRUA: TStringField
      FieldName = 'RUA'
      Size = 50
    end
    object uqClientesBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 45
    end
    object uqClientesCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 45
    end
    object uqClientesCEP: TStringField
      FieldName = 'CEP'
      FixedChar = True
      Size = 8
    end
    object uqClientesUF: TStringField
      FieldName = 'UF'
      FixedChar = True
      Size = 2
    end
    object uqClientesFONE: TStringField
      FieldName = 'FONE'
      Size = 15
    end
    object uqClientesDATANASC: TDateField
      FieldName = 'DATANASC'
    end
    object uqClientesTIPO: TIntegerField
      FieldName = 'TIPO'
      Required = True
    end
  end
  object udsClientes: TUniDataSource
    DataSet = uqClientes
    Left = 161
    Top = 168
  end
end
