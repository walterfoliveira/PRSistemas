unit uCliente;

interface

type

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
    { private declarations }
  protected
    { protected declarations }

    FId: Integer;
    FNome: String;
    FNomeMae: String;
    FNomePai: String;
    FCpf: String;
    FRg: String;

  public
    { public declarations }

    property Id: Integer read GetId write SetId;
    property Nome: String read GetNome write SetNome;
    property NomeMae: String read GetNomeMae write SetNomeMae;
    property NomePai: String read GetNomePai write SetNomePai;
    property Cpf: String read GetCpf write SetCpf;
    property Rg: String read GetRg write SetRg;

  published
    { published declarations }
  end;

implementation

{ TCliente }

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

procedure TCliente.SetRg(const Value: String);
begin
 FRg:= Value;
end;

end.
