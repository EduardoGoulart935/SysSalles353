unit uCadClientes;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, Data.DB,
  DBAccess, Uni, MemDS, Data.Bind.EngExt, Fmx.Bind.DBEngExt, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TfCadClientes = class(TForm)
    pTopo: TPanel;
    pTopo01: TPanel;
    lTitulo: TLabel;
    pTopo02: TPanel;
    Panel1: TPanel;
    RegPrimeiro: TImageViewer;
    RegAnterior: TImageViewer;
    RegProximo: TImageViewer;
    RegUltimo: TImageViewer;
    Panel2: TPanel;
    Inserir: TImageViewer;
    Deletar: TImageViewer;
    Editar: TImageViewer;
    Gravar: TImageViewer;
    Cancelar: TImageViewer;
    Atualizar: TImageViewer;
    Sair: TImageViewer;
    lbNome: TLabel;
    lbCPF_CNPJ: TLabel;
    lbRua: TLabel;
    lbBairro: TLabel;
    edtNome: TEdit;
    edtCPF_CNPJ: TEdit;
    edtRua: TEdit;
    edtBairro: TEdit;
    lbID: TLabel;
    pCodigo: TPanel;
    lCodigoID: TLabel;
    lbCidade: TLabel;
    edtCidade: TEdit;
    lbCEP: TLabel;
    edtCEP: TEdit;
    lbUF: TLabel;
    edtUF: TEdit;
    lbFone: TLabel;
    edtFone: TEdit;
    lbDataNasc: TLabel;
    edtDataNasc: TEdit;
    lbTipo: TLabel;
    edtTipo: TEdit;
    edtCodigo: TEdit;
    uqClientes: TUniQuery;
    uqClientesCODCLI: TIntegerField;
    uqClientesNOME: TStringField;
    uqClientesCPF_CNPJ: TStringField;
    uqClientesRUA: TStringField;
    uqClientesBAIRRO: TStringField;
    uqClientesCIDADE: TStringField;
    uqClientesCEP: TStringField;
    uqClientesUF: TStringField;
    uqClientesFONE: TStringField;
    uqClientesDATANASC: TDateField;
    uqClientesTIPO: TIntegerField;
    udsClientes: TUniDataSource;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkPropertyToFieldText: TLinkPropertyToField;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkControlToField9: TLinkControlToField;
    LinkControlToField10: TLinkControlToField;
    procedure RegPrimeiroClick(Sender: TObject);
    procedure RegAnteriorClick(Sender: TObject);
    procedure InserirClick(Sender: TObject);
    procedure DeletarClick(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure GravarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadClientes: TfCadClientes;

implementation

{$R *.fmx}

uses uModulo;


procedure TfCadClientes.CancelarClick(Sender: TObject);
begin
          ShowMessage ('Atividades canceladas!');
          uqClientes.Cancel;
end;

procedure TfCadClientes.DeletarClick(Sender: TObject);
begin // Verificar se a tabela está em Inserção ou Edição
if (uqClientes.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!' + CHR(13)+
'Cancele, antes de Deletar');
Exit;
End;
// Perguntar antes
If MessageDlg('Deletar Registro?',
TMsgDlgType.MTConfirmation,
[TMsgDlgBtn.MBYes, TMsgDlgBtn.MBNO],0)
= MRYes
Then Begin
uqClientes.Delete; // Excluindo registro
ShowMessage ('Excluído com Sucesso!');
End
Else ShowMessage ('Não Excluído!')
end;

procedure TfCadClientes.EditarClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqClientes.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqClientes.Edit;
end;

procedure TfCadClientes.GravarClick(Sender: TObject);
begin
// Criticas antes de salvar
// Verificar se a tabela está em Inserção ou Edição
If (uqClientes.State) in [dsInsert, dsEdit]
Then Begin
uqClientes.Post; // metodo para gravar
ShowMessage ('Dados gravados com sucesso!');
Exit;
End;
ShowMessage ('Tabela não está em Edição ou Inserção!'
+ CHR(13)+
'Gravação Cancelada!');
end;

procedure TfCadClientes.InserirClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqClientes.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqClientes.Insert;
end;
procedure TfCadClientes.RegAnteriorClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqClientes.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqClientes.Prior;
end;
procedure TfCadClientes.RegPrimeiroClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqClientes.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqClientes.First;
end;

procedure TfCadClientes.SairClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
If (uqClientes.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela está em uso!' + CHR(13)+
'Cancele, antes de Sair');
Exit;
End;
Close;
end;

end.
