unit uPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfPrincipal = class(TForm)
    CadUsuarios: TImageViewer;
    CadProdutos: TImageViewer;
    CadClientes: TImageViewer;
    CadFornecedores: TImageViewer;
    Vendas: TImageViewer;
    Compras: TImageViewer;
    Relatorios: TImageViewer;
    Sair: TImageViewer;
    p1_Topo: TPanel;
    p3_Esquerda: TPanel;
    p2_Rodape: TPanel;
    p4_Direita: TPanel;
    p5_Meio: TPanel;
    procedure CadUsuariosClick(Sender: TObject);
    procedure CadProdutosClick(Sender: TObject);
    procedure CadClientesClick(Sender: TObject);
    procedure CadFornecedoresClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPrincipal: TfPrincipal;

implementation

{$R *.fmx}

uses uCadClientes, uCadFornecedores, uCadProdutos, uCadUsuarios;

procedure TfPrincipal.CadClientesClick(Sender: TObject);
begin
          Application.CreateForm(TfCadClientes, fCadClientes);
          fCadClientes.ShowModal;
end;

procedure TfPrincipal.CadFornecedoresClick(Sender: TObject);
begin
          Application.CreateForm(TfCadFornecedores, fCadFornecedores);
          fCadFornecedores.ShowModal;
end;

procedure TfPrincipal.CadProdutosClick(Sender: TObject);
begin
          Application.CreateForm(TfCadProdutos, fCadProdutos);
          fCadProdutos.ShowModal;
end;

procedure TfPrincipal.CadUsuariosClick(Sender: TObject);
begin
          Application.CreateForm(TfCadUsuarios, fCadUsuarios);
          FCadUsuarios.ShowModal;
end;

procedure TfPrincipal.SairClick(Sender: TObject);
begin
          Application.Terminate;
end;

end.
