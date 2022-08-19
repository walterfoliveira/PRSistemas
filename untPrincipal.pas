unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.ODBCBase, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, ClienteController,
  uCliente, Datasnap.DBClient, Datasnap.Provider, Vcl.DBCtrls;

type

  TOperacao = (opNovo, opAlterar, opGravar, opCancelar, opNavegar);
  TAvisoPreechimento = (avGeral, avCampo, avSemAviso);

  TfmCliente = class(TForm)
    dsConsulta: TDataSource;
    PagA: TPageControl;
    TabConsulta: TTabSheet;
    TabCrud: TTabSheet;
    pnpFiltro: TPanel;
    edtFiltro: TEdit;
    lblFiltro: TLabel;
    btnFiltrar: TButton;
    Panel1: TPanel;
    btnNovo: TButton;
    btnSelecionar: TButton;
    btnExcluir: TButton;
    gridConsulta: TDBGrid;
    lblEdtID: TLabeledEdit;
    lblEdtNome: TLabeledEdit;
    lblEdtCpf: TLabeledEdit;
    lblEdtRg: TLabeledEdit;
    lblEdtNomeMae: TLabeledEdit;
    lblEdtNomePai: TLabeledEdit;
    Panel2: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    cdsConsulta: TClientDataSet;
    dspConsulta: TDataSetProvider;
    sqlConsulta: TFDQuery;
    lblEdtCep: TLabeledEdit;
    btnBuscaCep: TButton;
    lblEdtEndereco: TLabeledEdit;
    lblEdtNumero: TLabeledEdit;
    lblEdtCidade: TLabeledEdit;
    lblEdtUf: TLabeledEdit;
    Panel3: TPanel;
    btnFechar: TButton;
    btnImprimir: TButton;
    cdsConsultaid: TAutoIncField;
    cdsConsultanome: TStringField;
    cdsConsultacpf: TStringField;
    cdsConsultarg: TStringField;
    btnImprimirFicha: TButton;
    procedure btnFiltrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lblEdtNomeEnter(Sender: TObject);
    procedure lblEdtNomeExit(Sender: TObject);
    procedure btnBuscaCepClick(Sender: TObject);
    procedure lblEdtCepEnter(Sender: TObject);
    procedure lblEdtCepExit(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure cdsConsultaAfterOpen(DataSet: TDataSet);
    procedure btnImprimirFichaClick(Sender: TObject);
  private
    { Private declarations }

    // Controle tipod de operacao
    FOperacao: TOperacao;

    // Validacao
    Procedure ValidaCampos();

    // procedure de pesquisa
    procedure Pesquisar;

    // Limpa Edits - Somente TEdit;
    procedure LimpaEdits;

    // Atualiza estado dos Botoes
    procedure EstadoBotoes;

    procedure SelecionarCliente(Id: Integer);

  public
    { Public declarations }
  end;

var
  fmCliente: TfmCliente;

implementation

{$R *.dfm}

uses uDao, untDMConexao, Funcoes, untDMReport;

procedure TfmCliente.ValidaCampos;
begin
  if (lblEdtNome.Text = EmptyStr) OR (lblEdtNomeMae.Text = EmptyStr) OR
    (lblEdtNomePai.Text = EmptyStr) OR (lblEdtCpf.Text = EmptyStr) OR
    (lblEdtRg.Text = EmptyStr) then

    raise Exception.Create('Erro de Valida��o, preencha os campos do Cliente!');

  if (lblEdtEndereco.Text = EmptyStr) OR (lblEdtNumero.Text = EmptyStr) OR
    (lblEdtCidade.Text = EmptyStr) OR (lblEdtUf.Text = EmptyStr) OR
    (lblEdtCep.Text = EmptyStr) then

    raise Exception.Create
      ('Erro de Valida��o, preencha os campos do Endere�o!');

end;

procedure TfmCliente.EstadoBotoes;
begin
  btnListar.Enabled := true;
  btnAlterar.Enabled := true;
  btnImprimirFicha.Enabled := true;
  btnGravar.Enabled := false;
  btnCancelar.Enabled := false;

  case FOperacao Of
    opNovo:
      begin // Novo e Alterar
        btnListar.Enabled := false;
        btnAlterar.Enabled := false;
        btnImprimirFicha.Enabled := false;
        btnGravar.Enabled := true;
        btnCancelar.Enabled := true;
      end;

    opAlterar:
      begin // Alterar
        btnListar.Enabled := false;
        btnAlterar.Enabled := false;
        btnImprimirFicha.Enabled := false;
        btnGravar.Enabled := true;
        btnCancelar.Enabled := true;
      end;

  end;
end;

procedure TfmCliente.LimpaEdits;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[i].ClassName = 'TLabeledEdit') then
      if TLabeledEdit(Self.Components[i]).Tag > 0 then
        TLabeledEdit(Self.Components[i]).Clear
  end;
end;

procedure TfmCliente.Pesquisar;
Var
  sqlText: String;
begin
  sqlText := 'Select Id, Nome, Cpf, Rg from dbo.cliente';
  if (Trim(edtFiltro.Text) <> EmptyStr) then
    sqlText := sqlText + ' Where upper(Nome) Like ' +
      QuotedStr('%' + UpperCase(Trim(edtFiltro.Text)) + '%');

  cdsConsulta.Close;
  cdsConsulta.CommandText := sqlText;
  cdsConsulta.Open;
end;

procedure TfmCliente.SelecionarCliente(Id: Integer);
Var
  Cliente: TClienteController;
  CliObj: TCliente;
  strErro: String;
begin
  Cliente := TClienteController.Create;
  try

    strErro := EmptyStr;

    CliObj := Cliente.GetbyId(Id, strErro);
    if (strErro <> EmptyStr) then
      raise Exception.Create('Erro ao Selecionar o cliente' + #13 + strErro);

    lblEdtID.Tag := CliObj.Id;
    lblEdtID.Text := FormatFloat('000', CliObj.Id);
    lblEdtNome.Text := CliObj.Nome;
    lblEdtNomeMae.Text := CliObj.NomeMae;
    lblEdtNomePai.Text := CliObj.NomePai;
    lblEdtCpf.Text := CliObj.Cpf;
    lblEdtRg.Text := CliObj.Rg;

    // Endereco
    lblEdtEndereco.Tag := CliObj.EndCliente.Id;
    lblEdtEndereco.Text := CliObj.EndCliente.Endereco;
    lblEdtNumero.Text := CliObj.EndCliente.Numero;
    lblEdtCidade.Text := CliObj.EndCliente.Cidade;
    lblEdtUf.Text := CliObj.EndCliente.Estado;
    lblEdtCep.Text := CliObj.EndCliente.Cep;

    FOperacao := opNavegar;
    EstadoBotoes();
    PagA.ActivePageIndex := 1;

  finally
    Cliente.Free;
  end;

end;

procedure TfmCliente.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TfmCliente.btnFiltrarClick(Sender: TObject);
begin
  Pesquisar();
end;

procedure TfmCliente.btnNovoClick(Sender: TObject);
begin
  FOperacao := opNovo;

  LimpaEdits();
  EstadoBotoes();
  PagA.ActivePageIndex := 1;
  lblEdtNome.SetFocus;
end;

procedure TfmCliente.btnSelecionarClick(Sender: TObject);
begin
  SelecionarCliente(cdsConsultaid.AsInteger);
end;

procedure TfmCliente.cdsConsultaAfterOpen(DataSet: TDataSet);
begin
  btnSelecionar.Enabled := not cdsConsulta.IsEmpty;
  btnExcluir.Enabled := not cdsConsulta.IsEmpty;
  btnImprimir.Enabled := not cdsConsulta.IsEmpty;
end;

procedure TfmCliente.btnBuscaCepClick(Sender: TObject);
Var
  Endereco: TStringList;
begin
  btnBuscaCep.Enabled := false;
  Endereco := BuscarCEPNoViaCEP(lblEdtCep.Text);
  btnBuscaCep.Enabled := true;

  if Endereco.Count = 5 then
  begin
    lblEdtEndereco.Text := Endereco[0];
    lblEdtCidade.Text := Endereco[3];
    lblEdtUf.Text := Endereco[2];
    lblEdtNumero.SetFocus;
  end;

end;

procedure TfmCliente.btnExcluirClick(Sender: TObject);
Var
  Cliente: TClienteController;
  strErro: String;
begin
  If (Application.MessageBox(PChar('Confirmar a Exclus�o deste Cliente ?'),
    PChar('RW Consultoria'), MB_IconQuestion + MB_YesNo + MB_DefButton2)
    = idYes) Then
  begin

    Cliente := TClienteController.Create;
    try
      strErro := EmptyStr;
      Cliente.Delete(cdsConsultaid.AsInteger, strErro);
      if (strErro <> EmptyStr) then
        raise Exception.Create('Erro ao Deletar o cliente' + #13 + strErro);

      FOperacao := opNavegar;
      EstadoBotoes();
      PagA.ActivePageIndex := 0;

      Pesquisar();
    finally
      Cliente.Free;
    end;
  end;
end;

procedure TfmCliente.lblEdtCepEnter(Sender: TObject);
begin
  TLabeledEdit(Sender).Color := clAqua;
  btnBuscaCep.Default := true;
end;

procedure TfmCliente.lblEdtCepExit(Sender: TObject);
begin
  TLabeledEdit(Sender).Color := clWindow;
  btnBuscaCep.Default := false;
end;

procedure TfmCliente.FormShow(Sender: TObject);
begin
  edtFiltro.Clear;
  TabConsulta.TabVisible := false;
  TabCrud.TabVisible := false;

  PagA.ActivePage := TabConsulta;

  Pesquisar();
end;

procedure TfmCliente.lblEdtNomeEnter(Sender: TObject);
begin
  TLabeledEdit(Sender).Color := clAqua;
end;

procedure TfmCliente.lblEdtNomeExit(Sender: TObject);
begin
  TLabeledEdit(Sender).Color := clWindow;
end;

procedure TfmCliente.btnListarClick(Sender: TObject);
begin
  FOperacao := opNavegar;
  EstadoBotoes();
  Pesquisar();

  PagA.ActivePageIndex := 0;
end;

procedure TfmCliente.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  EstadoBotoes();

  lblEdtNome.SetFocus;
end;

procedure TfmCliente.btnGravarClick(Sender: TObject);
Var
  Cliente: TClienteController;
  CliObj: TCliente;
  CliEndObj: TEndereco;

  strErro: String;
begin
  ValidaCampos();

  Cliente := TClienteController.Create;
  CliObj := TCliente.Create;
  CliEndObj := TEndereco.Create;

  try
    strErro := EmptyStr;
    CliObj.Id := 0; // Novo
    if (FOperacao = TOperacao.opAlterar) then // Caso seja Alterar
      CliObj.Id := lblEdtID.Tag;

    CliEndObj.Id := 0; // Novo
    if (FOperacao = TOperacao.opAlterar) then // Caso seja Alterar
      CliEndObj.Id := lblEdtEndereco.Tag;

    // Preenche dados do Endereco do Cliente
    CliEndObj.IdCliente := CliObj.Id;
    CliEndObj.Endereco := lblEdtEndereco.Text;
    CliEndObj.Numero := lblEdtNumero.Text;
    CliEndObj.Cidade := lblEdtCidade.Text;
    CliEndObj.Estado := lblEdtUf.Text;
    CliEndObj.Cep := lblEdtCep.Text;

    // Preenche dados do Cliente
    CliObj.Nome := lblEdtNome.Text;
    CliObj.NomeMae := lblEdtNomeMae.Text;
    CliObj.NomePai := lblEdtNomePai.Text;
    CliObj.Cpf := lblEdtCpf.Text;
    CliObj.Rg := lblEdtRg.Text;
    CliObj.EndCliente := CliEndObj;

    // Grava
    Cliente.InsertUpdate(CliObj, strErro);
    if (strErro <> EmptyStr) then
      raise Exception.Create('Erro ao Gravar o Cliente' + #13 + strErro);

    FOperacao := opNavegar;
    EstadoBotoes();
    LimpaEdits();
    Pesquisar();

    PagA.ActivePageIndex := 0;

  finally
    Cliente.Free;
    CliObj.Free;
  end;

end;

procedure TfmCliente.btnImprimirClick(Sender: TObject);
begin
  DMReport.frxRepClientesSimples.ShowReport();
end;

procedure TfmCliente.btnImprimirFichaClick(Sender: TObject);
begin

  DMReport.cdsCliente.Close;
  DMReport.cdsCliente.Open;
  DMReport.cdsCliente.Append;

  DMReport.cdsClienteId.AsInteger := lblEdtID.Tag;
  DMReport.cdsClienteNome.AsString := lblEdtNome.Text;
  DMReport.cdsClienteNomeMae.AsString := lblEdtNomeMae.Text;
  DMReport.cdsClienteNomePai.AsString := lblEdtNomePai.Text;
  DMReport.cdsClienteCPF.AsString := lblEdtCpf.Text;
  DMReport.cdsClienteRG.AsString := lblEdtRg.Text;

  DMReport.cdsClienteEndereco.AsString := lblEdtEndereco.Text + ', ' + lblEdtNumero.Text;
  DMReport.cdsClienteCidade.AsString := lblEdtCidade.Text + ' - ' + lblEdtUf.Text;
  DMReport.cdsClienteCep.AsString := lblEdtCep.Text;
  DMReport.cdsCliente.Post;

  DMReport.frxRepClienteFicha.ShowReport();
end;

procedure TfmCliente.btnCancelarClick(Sender: TObject);
begin
  If (Application.MessageBox(PChar('Deseja cancelar esta opera��o?'),
    PChar('RW Consultoria'), MB_IconQuestion + MB_YesNo + MB_DefButton2)
    = idYes) Then
  begin

    FOperacao := opNavegar;
    PagA.ActivePageIndex := 0;
    EstadoBotoes();
    LimpaEdits();

  end;
end;

end.
