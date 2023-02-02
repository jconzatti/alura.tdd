unit UJconzatti.TDD.CasoUso.Funcionario.Bonus;

interface

uses
   System.Math,
   System.SysUtils,
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
	Result := RoundTo(FFuncionario.Salario * 0.1, -2);
   if Result > 1000 then
      raise ENotSupportedException.Create('Funcion�rio com sal�rio maior que R$ 1.000,00 n�o pode receber bonus!');
end;

end.
