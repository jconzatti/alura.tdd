program tdd.linha.comando;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UJconzatti.TDD.Entidade.Funcionario in '..\entidade\UJconzatti.TDD.Entidade.Funcionario.pas',
  UJconzatti.TDD.CasoUso.Funcionario.Bonus in '..\casouso\UJconzatti.TDD.CasoUso.Funcionario.Bonus.pas';

begin
   try
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end;
end.
