unit untDMReport;

interface

uses
  System.SysUtils, System.Classes, untPrincipal, frxClass, frxDBSet, Data.DB,
  Datasnap.DBClient;

type
  TDMReport = class(TDataModule)
    frxRepClientesSimples: TfrxReport;
    frxDBConsulta: TfrxDBDataset;
    frxRepClienteFicha: TfrxReport;
    cdsCliente: TClientDataSet;
    cdsClienteId: TIntegerField;
    cdsClienteNome: TStringField;
    cdsClienteNomeMae: TStringField;
    cdsClienteNomePai: TStringField;
    cdsClienteCPF: TStringField;
    cdsClienteRG: TStringField;
    cdsClienteEndereco: TStringField;
    cdsClienteCidade: TStringField;
    cdsClienteCep: TStringField;
    frxDBFicha: TfrxDBDataset;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMReport: TDMReport;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}



{$R *.dfm}

end.
