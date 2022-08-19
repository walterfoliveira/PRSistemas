unit uCliente;

interface

type

  TEndereco = Class
  private
    function GetCep: String;
    function GetCidade: String;
    function GetEndereco: String;
    function GetEstado: String;
    function GetId: Integer;
    function GetIdCliente: Integer;
    function GetNumero: String;
    procedure SetCep(const Value: String);
    procedure SetCidade(const Value: String);
    procedure SetEndereco(const Value: String);
    procedure SetEstado(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetIdCliente(const Value: Integer);
    procedure SetNumero(const Value: String);
    { private declarations }

  protected
    { protected declarations }
    FId: Integer;
    FIdCliente: Integer;
    FEndereco: String;
    FNum: String;
    FCidade: String;
    FEstado: String;
    FCep: String;

  public
    { public declarations }

  published
    { published declarations }
    property Id: Integer read GetId write SetId;
    property IdCliente: Integer read GetIdCliente write SetIdCliente;
    property Endereco: String read GetEndereco write SetEndereco;
    property Numero: String read GetNumero write SetNumero;
    property Cidade: String read GetCidade write SetCidade;
    property Estado: String read GetEstado write SetEstado;
    property Cep: String read GetCep write SetCep;
  End;


  TCliente = class
  private
    function GetCpf: String;
    function GetId: Integer;
    function GetNome: String;
    function GetNomeMae: String;
    function GetNomePai: String;
    function GetRg: String;
    procedure SetCpf(const Value: String);
    procedure SetId(const Value: Integer);
    procedure SetNome(const Value: String);
    procedure SetNomeMae(const Value: String);
    procedure SetNomePai(const Value: String);
    procedure SetRg(const Value: String);
    function GetEndereco: TEndereco;
    procedure SetEndereco(const Value: TEndereco);
    { private declarations }
  protected
    { protected declarations }

    FId: Integer;
    FNome: String;
    FNomeMae: String;
    FNomePai: String;
    FCpf: String;
    FRg: String;
    FEndCliente: TEndereco;

  public
    { public declarations }

    property Id: Integer read GetId write SetId;
    property Nome: String read GetNome write SetNome;
    property NomeMae: String read GetNomeMae write SetNomeMae;
    property NomePai: String read GetNomePai write SetNomePai;
    property Cpf: String read GetCpf write SetCpf;
    property Rg: String read GetRg write SetRg;
    property EndCliente: TEndereco read GetEndereco write SetEndereco;

  published
    { published declarations }
  end;



implementation

{ TCliente }

function TCliente.GetEndereco: TEndereco;
begin
 Result:= FEndCliente;
end;

function TCliente.GetId: Integer;
begin
 Result:= Fid;
end;

function TCliente.GetNome: String;
begin
 Result:= FNome;
end;

function TCliente.GetNomeMae: String;
begin
 Result:= FNomeMae;
end;

function TCliente.GetNomePai: String;
begin
 Result:= FNomePai;
end;

function TCliente.GetCpf: String;
begin
 Result:= FCpf;
end;

function TCliente.GetRg: String;
begin
 Result:= FRg;
end;



procedure TCliente.SetId(const Value: Integer);
begin
 FId:= Value;
end;

procedure TCliente.SetNome(const Value: String);
begin
 FNome:= Value;
end;

procedure TCliente.SetNomeMae(const Value: String);
begin
 FNomeMae:= Value;
end;

procedure TCliente.SetNomePai(const Value: String);
begin
 FNomePai:= Value;
end;

procedure TCliente.SetCpf(const Value: String);
begin
 FCpf:= Value;
end;

procedure TCliente.SetEndereco(const Value: TEndereco);
begin
 FEndCliente:= Value;
end;

procedure TCliente.SetRg(const Value: String);
begin
 FRg:= Value;
end;




{ TEndereco }

function TEndereco.GetCep: String;
begin
 Result:= FCep;
end;

function TEndereco.GetCidade: String;
begin
 Result:= FCidade;
end;

function TEndereco.GetEndereco: String;
begin
 Result:= FEndereco;
end;

function TEndereco.GetEstado: String;
begin
 Result:= FEstado;
end;

function TEndereco.GetId: Integer;
begin
 Result:= FId;
end;

function TEndereco.GetIdCliente: Integer;
begin
 Result:= FIdCliente;
end;

function TEndereco.GetNumero: String;
begin
 Result:= FNum;
end;

procedure TEndereco.SetCep(const Value: String);
begin
 FCep:= Value;
end;

procedure TEndereco.SetCidade(const Value: String);
begin
 FCidade:= Value;
end;

procedure TEndereco.SetEndereco(const Value: String);
begin
 FEndereco:= Value;
end;

procedure TEndereco.SetEstado(const Value: String);
begin
 FEstado:= Value;
end;

procedure TEndereco.SetId(const Value: Integer);
begin
 FId:= Value;
end;

procedure TEndereco.SetIdCliente(const Value: Integer);
begin
 FIdCliente:= Value;
end;

procedure TEndereco.SetNumero(const Value: String);
begin
 FNum:= Value;
end;

end.
