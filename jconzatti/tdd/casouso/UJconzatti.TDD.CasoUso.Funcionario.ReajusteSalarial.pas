unit UJconzatti.TDD.CasoUso.Funcionario.ReajusteSalarial;

interface

uses
   UJconzatti.TDD.Entidade.Funcionario,
   UJconzatti.TDD.Entidade.Funcionario.Desempenho;

type
   TCasoUsoFuncionarioReajusteSalarial = class
   private
      FFuncionario : TEntidadeFuncionario;
   public
      constructor Create(aFuncionario: TEntidadeFuncionario); reintroduce;
      procedure ReajustarSalario(aFuncionarioDesempenho: TEntidadeFuncionarioDesempenho);
   end;

implementation

{ TCasoUsoFuncionarioReajusteSalarial }

constructor TCasoUsoFuncionarioReajusteSalarial.Create(
  aFuncionario: TEntidadeFuncionario);
begin
   FFuncionario := aFuncionario;
end;

procedure TCasoUsoFuncionarioReajusteSalarial.ReajustarSalario(
  aFuncionarioDesempenho: TEntidadeFuncionarioDesempenho);
var VlReajusteSalarial : Double;
begin
   VlReajusteSalarial := FFuncionario.Salario * aFuncionarioDesempenho.ObterPercentualDeReajuste;
   FFuncionario.ReajustarSalario(VlReajusteSalarial);
end;

end.
