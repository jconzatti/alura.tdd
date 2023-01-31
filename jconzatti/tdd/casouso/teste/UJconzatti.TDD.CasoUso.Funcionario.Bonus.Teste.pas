unit UJconzatti.TDD.CasoUso.Funcionario.Bonus.Teste;

interface

uses
   DUnitX.TestFramework,
   UJconzatti.TDD.Entidade.Funcionario,
   UJconzatti.TDD.CasoUso.Funcionario.Bonus;

type
   [TestFixture]
   TCasoUsoFuncionarioBonusTeste = class
   public
      [Test]
      procedure TestarValorDoBonusZeroParaFuncionarioComSalarioMaiorQue10000;
      [Test]
      procedure TestarValorDoBonus10PorCentoParaFuncionarioComSalarioMenorQue10000;
      [Test]
      procedure TestarValorDoBonus10PorCentoParaFuncionarioComSalarioIgualA10000;
   end;

implementation

procedure TCasoUsoFuncionarioBonusTeste.TestarValorDoBonusZeroParaFuncionarioComSalarioMaiorQue10000;
var aFuncionario : TEntidadeFuncionario;
    aFuncionarioBonus : TCasoUsoFuncionarioBonus;
    VlBonus : Double;
begin
   aFuncionario := TEntidadeFuncionario.Create('Jhoni Conzatti', 0, 15000);
   try
      aFuncionarioBonus := TCasoUsoFuncionarioBonus.Create(aFuncionario);
      try
         VlBonus := aFuncionarioBonus.CalcularBonus;
         Assert.AreEqual(0.00, VlBonus);
      finally
         aFuncionarioBonus.Destroy;
      end;
   finally
      aFuncionario.Destroy;
   end;
end;

procedure TCasoUsoFuncionarioBonusTeste.TestarValorDoBonus10PorCentoParaFuncionarioComSalarioMenorQue10000;
var aFuncionario : TEntidadeFuncionario;
    aFuncionarioBonus : TCasoUsoFuncionarioBonus;
    VlBonus : Double;
begin
   aFuncionario := TEntidadeFuncionario.Create('Jhoni Conzatti', 0, 2573.00);
   try
      aFuncionarioBonus := TCasoUsoFuncionarioBonus.Create(aFuncionario);
      try
         VlBonus := aFuncionarioBonus.CalcularBonus;
         Assert.AreEqual(257.30, VlBonus);
      finally
         aFuncionarioBonus.Destroy;
      end;
   finally
      aFuncionario.Destroy;
   end;
end;

procedure TCasoUsoFuncionarioBonusTeste.TestarValorDoBonus10PorCentoParaFuncionarioComSalarioIgualA10000;
var aFuncionario : TEntidadeFuncionario;
    aFuncionarioBonus : TCasoUsoFuncionarioBonus;
    VlBonus : Double;
begin
   aFuncionario := TEntidadeFuncionario.Create('Jhoni Conzatti', 0, 10000.00);
   try
      aFuncionarioBonus := TCasoUsoFuncionarioBonus.Create(aFuncionario);
      try
         VlBonus := aFuncionarioBonus.CalcularBonus;
         Assert.AreEqual(1000.00, VlBonus);
      finally
         aFuncionarioBonus.Destroy;
      end;
   finally
      aFuncionario.Destroy;
   end;
end;

initialization
   TDUnitX.RegisterTestFixture(TCasoUsoFuncionarioBonusTeste);

end.
