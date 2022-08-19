unit ClienteController;

interface

uses
 uCliente, untDMCliente, uDao, System.SysUtils;

type
 TClienteController = Class
 public
   constructor Create;
   destructor Destroy; override;

   function GetbyId(Id: Integer; var Erro: String): TCliente;
   function InsertUpdate(Cliente: TCliente; var Erro: String): Boolean;
   function Delete(Id: Integer; var Erro: String): Boolean;
 End;

implementation

{ TClienteController }

constructor TClienteController.Create;
begin
 DMCliente:= TDMCliente.Create(nil);
end;

destructor TClienteController.Destroy;
begin
  if Assigned(DMCliente) then
    freeAndNil(DMCliente);

  inherited;
end;

function TClienteController.GetbyId(Id: Integer; var Erro: String): TCliente;
begin
 Result:= DMCliente.GetCliente(Id, Erro);
end;

function TClienteController.InsertUpdate(Cliente: TCliente; var Erro: String): Boolean;
begin
 Result:= DMCliente.InsertUpdate(Cliente, Erro);
end;

function TClienteController.Delete(Id: Integer; var Erro: String): Boolean;
begin
 Result:= DMCliente.Delete(Id, Erro);
end;

end.
