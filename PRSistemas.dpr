program PRSistemas;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {fmCliente},
  uDao in 'Dao\uDao.pas',
  uCliente in 'Model\uCliente.pas',
  ClienteController in 'Controller\ClienteController.pas',
  untDMConexao in 'Dao\untDMConexao.pas' {DmConexao: TDataModule},
  untDMCliente in 'Dao\untDMCliente.pas' {DMCliente: TDataModule},
  Funcoes in 'Utils\Funcoes.pas',
  untDMReport in 'Dao\untDMReport.pas' {DMReport: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmCliente, fmCliente);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDMReport, DMReport);
  Application.Run;
end.
