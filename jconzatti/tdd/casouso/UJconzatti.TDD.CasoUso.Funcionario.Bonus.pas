unit UJconzatti.TDD.CasoUso.Funcionario.Bonus;

interface

uses
   UJconzatti.TDD.Entidade.Funcionario;

type
   TCasoUsoFuncionarioBonus = class
   private
      FFuncionario : TEntidadeFuncionario;
   public
      constructor Create(aFuncionario : TEntidadeFuncionario); reintroduce;
      function CalcularBonus: Currency;
   end;

implementation

{ TCasoUsoFuncionarioBonus }

constructor TCasoUsoFuncionarioBonus.Create(aFuncionario: TEntidadeFuncionario);
begin
   FFuncionario := aFuncionario;
end;

function TCasoUsoFuncionarioBonus.CalcularBonus: Currency;
begin
	Result = FFuncionario.Salario * 0.1;
   if Result > 1000 then
      Result := 0;
end;

end.