unit uCadFornecedores;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.StdCtrls, FMX.Controls.Presentation, FMX.Edit, Data.DB,
  DBAccess, Uni, MemDS, System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors,
  Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TfCadFornecedores = class(TForm)
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
    lbCNPJ: TLabel;
    lbRua: TLabel;
    lbBairro: TLabel;
    edtNome: TEdit;
    edtCNPJ: TEdit;
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
    uqFornecedores: TUniQuery;
    udsFornecedores: TUniDataSource;
    uqFornecedoresCODFORN: TIntegerField;
    uqFornecedoresNOME: TStringField;
    uqFornecedoresCNPJ: TStringField;
    uqFornecedoresRUA: TStringField;
    uqFornecedoresBAIRRO: TStringField;
    uqFornecedoresCIDADE: TStringField;
    uqFornecedoresCEP: TStringField;
    uqFornecedoresUF: TStringField;
    uqFornecedoresFONE: TStringField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    LinkControlToField5: TLinkControlToField;
    LinkControlToField6: TLinkControlToField;
    LinkControlToField7: TLinkControlToField;
    LinkControlToField8: TLinkControlToField;
    LinkPropertyToFieldText: TLinkPropertyToField;
    procedure RegPrimeiroClick(Sender: TObject);
    procedure RegAnteriorClick(Sender: TObject);
    procedure RegProximoClick(Sender: TObject);
    procedure RegUltimoClick(Sender: TObject);
    procedure InserirClick(Sender: TObject);
    procedure DeletarClick(Sender: TObject);
    procedure EditarClick(Sender: TObject);
    procedure GravarClick(Sender: TObject);
    procedure CancelarClick(Sender: TObject);
    procedure AtualizarClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fCadFornecedores: TfCadFornecedores;

implementation

{$R *.fmx}

procedure TfCadFornecedores.AtualizarClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqFornecedores.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela está em uso!' + CHR(13)+
'Cancele, antes de atualizar');
Exit;
End;
uqFornecedores.Refresh;
end;

procedure TfCadFornecedores.CancelarClick(Sender: TObject);
begin
ShowMessage ('Atividades canceladas!');
uqFornecedores.Cancel;
end;

procedure TfCadFornecedores.DeletarClick(Sender: TObject);
begin // Verificar se a tabela está em Inserção ou Edição
if (uqFornecedores.State) in [dsInsert, dsEdit]
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
uqFornecedores.Delete; // Excluindo registro
ShowMessage ('Excluído com Sucesso!');
End
Else ShowMessage ('Não Excluído!')
end;

procedure TfCadFornecedores.EditarClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqFornecedores.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqFornecedores.Edit;
end;

procedure TfCadFornecedores.GravarClick(Sender: TObject);
begin
// Criticas antes de salvar
// Verificar se a tabela está em Inserção ou Edição
If (uqFornecedores.State) in [dsInsert, dsEdit]
Then Begin
uqFornecedores.Post; // metodo para gravar
ShowMessage ('Dados gravados com sucesso!');
Exit;
End;
ShowMessage ('Tabela não está em Edição ou Inserção!'
+ CHR(13)+
'Gravação Cancelada!');
end;

procedure TfCadFornecedores.InserirClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqFornecedores.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqFornecedores.Insert;
end;

procedure TfCadFornecedores.RegAnteriorClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqFornecedores.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqFornecedores.Prior;
end;

procedure TfCadFornecedores.RegPrimeiroClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqFornecedores.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqFornecedores.First;
end;

procedure TfCadFornecedores.RegProximoClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqFornecedores.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqFornecedores.Next;
end;

procedure TfCadFornecedores.RegUltimoClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqFornecedores.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqFornecedores.Last;
end;

procedure TfCadFornecedores.SairClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
If (uqFornecedores.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela está em uso!' + CHR(13)+
'Cancele, antes de Sair');
Exit;
End;
Close;
end;
end.
