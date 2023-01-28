program tdd.linha.comando;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UJconzatti.TDD.Entidade.Funcionario in '..\entidade\UJconzatti.TDD.Entidade.Funcionario.pas',
  UJconzatti.TDD.CasoUso.Funcionario.Bonus in '..\casouso\UJconzatti.TDD.CasoUso.Funcionario.Bonus.pas',
  UJconzatti.TDD.CasoUso.Calculadora in '..\casouso\UJconzatti.TDD.CasoUso.Calculadora.pas';


var aCalculadora : TCasoUsoCalculadora;
begin
   try
      aCalculadora := TCasoUsoCalculadora.Create;
      try
         Writeln(aCalculadora.Somar(3,7));
         Writeln(aCalculadora.Somar(3,0));
         Writeln(aCalculadora.Somar(0,0));
         Writeln(aCalculadora.Somar(3,-1));
      finally
         aCalculadora.Destroy;
      end;
      Readln;
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end;
end.
