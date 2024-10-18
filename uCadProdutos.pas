unit uCadProdutos;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.StdCtrls, FMX.Controls.Presentation, Data.DB, DBAccess, Uni,
  MemDS, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.DBScope, FMX.Edit, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors;

type
  TfCadProdutos = class(TForm)
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
    uqProdutos: TUniQuery;
    udsProdutos: TUniDataSource;
    lbNome: TLabel;
    lbCodCateg: TLabel;
    lbQTDEST: TLabel;
    lbVALUNIT: TLabel;
    edtNome: TEdit;
    edtCodCateg: TEdit;
    edtQTDEST: TEdit;
    edtVALUNIT: TEdit;
    lbID: TLabel;
    pCodigo: TPanel;
    lCodigoID: TLabel;
    uqProdutosCODPROD: TIntegerField;
    uqProdutosNOME: TStringField;
    uqProdutosCODCATEG: TIntegerField;
    uqProdutosQTDEST: TIntegerField;
    uqProdutosVALUNIT: TFloatField;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
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
  fCadProdutos: TfCadProdutos;

implementation

{$R *.fmx}

procedure TfCadProdutos.RegPrimeiroClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqProdutos.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqProdutos.First;
end;

procedure TfCadProdutos.RegProximoClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqProdutos.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqProdutos.Next;
end;

procedure TfCadProdutos.RegUltimoClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqProdutos.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqProdutos.Last;
end;

procedure TfCadProdutos.SairClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
If (uqProdutos.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela está em uso!' + CHR(13)+
'Cancele, antes de Sair');
Exit;
End;
Close;
end;

procedure TfCadProdutos.AtualizarClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqProdutos.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela está em uso!' + CHR(13)+
'Cancele, antes de atualizar');
Exit;
End;
uqProdutos.Refresh;
end;

procedure TfCadProdutos.CancelarClick(Sender: TObject);
begin
ShowMessage ('Atividades canceladas!');
uqProdutos.Cancel;
end;

procedure TfCadProdutos.DeletarClick(Sender: TObject);
begin // Verificar se a tabela está em Inserção ou Edição
if (uqProdutos.State) in [dsInsert, dsEdit]
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
uqProdutos.Delete; // Excluindo registro
ShowMessage ('Excluído com Sucesso!');
End
Else ShowMessage ('Não Excluído!')
end;

procedure TfCadProdutos.EditarClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqProdutos.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqProdutos.Edit;
end;

procedure TfCadProdutos.GravarClick(Sender: TObject);
begin
// Criticas antes de salvar
// Verificar se a tabela está em Inserção ou Edição
If (uqProdutos.State) in [dsInsert, dsEdit]
Then Begin
uqProdutos.Post; // metodo para gravar
ShowMessage ('Dados gravados com sucesso!');
Exit;
End;
ShowMessage ('Tabela não está em Edição ou Inserção!'
+ CHR(13)+
'Gravação Cancelada!');
end;

procedure TfCadProdutos.InserirClick(Sender: TObject);
begin
// Verificar se a tabela está em Inserção ou Edição
if (uqProdutos.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqProdutos.Insert;
end;

procedure TfCadProdutos.RegAnteriorClick(Sender: TObject);
begin
           begin
// Verificar se a tabela está em Inserção ou Edição
if (uqProdutos.State) in [dsInsert, dsEdit]
Then Begin
ShowMessage ('Tabela já está em uso!'+
CHR(13)+
'Cancele, se desejar');
Exit;
End;
uqProdutos.Prior;
end;
end;

end.
