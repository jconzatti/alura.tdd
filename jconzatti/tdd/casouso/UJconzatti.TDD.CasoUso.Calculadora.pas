unit UJconzatti.TDD.CasoUso.Calculadora;

interface

type
   TCasoUsoCalculadora = class
   public
      function Somar(a, b: Integer): Integer;
   end;

implementation

{ TCasoUsoCalculadora }

function TCasoUsoCalculadora.Somar(a, b: Integer): Integer;
begin
   Result := a+b;
end;

end.
