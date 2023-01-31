unit UJconzatti.TDD.CasoUso.Funcionario.ReajusteSalarial.Teste;

interface
uses
   DUnitX.TestFramework,
   UJconzatti.TDD.Entidade.Funcionario,
   UJconzatti.TDD.Entidade.Funcionario.Desempenho,
   UJconzatti.TDD.CasoUso.Funcionario.ReajusteSalarial;

type
   [TestFixture]
   TCasoUsoFuncionarioReajusteSalarialTeste = class
   public
      [Test]
      procedure TestarReajusteSalariaDe3PorCentoSeDesempenhoForADesejar;
      [Test]
      procedure TestarReajusteSalariaDe15PorCentoSeDesempenhoForBom;
      [Test]
      procedure TestarReajusteSalariaDe20PorCentoSeDesempenhoForOtimo;
   end;

implementation


{ TCasoUsoFuncionarioReajusteSalarialTeste }

procedure TCasoUsoFuncionarioReajusteSalarialTeste.TestarReajusteSalariaDe3PorCentoSeDesempenhoForADesejar;
var aFuncionario : TEntidadeFuncionario;
    aFuncionarioReajusteSalarial : TCasoUsoFuncionarioReajusteSalarial;
    VlSalario : Double;
begin
   aFuncionario := TEntidadeFuncionario.Create('Jhoni Conzatti', 0, 2000);
   try
      aFuncionarioReajusteSalarial := TCasoUsoFuncionarioReajusteSalarial.Create(aFuncionario);
      try
         aFuncionarioReajusteSalarial.ReajustarSalario(fdADesejar);
         VlSalario := aFuncionario.Salario;
         Assert.AreEqual(2060.00, VlSalario);
      finally
         aFuncionarioReajusteSalarial.Destroy;
      end;
   finally
      aFuncionario.Destroy;
   end;
end;

procedure TCasoUsoFuncionarioReajusteSalarialTeste.TestarReajusteSalariaDe15PorCentoSeDesempenhoForBom;
var aFuncionario : TEntidadeFuncionario;
    aFuncionarioReajusteSalarial : TCasoUsoFuncionarioReajusteSalarial;
    VlSalario : Double;
begin
   aFuncionario := TEntidadeFuncionario.Create('Jhoni Conzatti', 0, 2000);
   try
      aFuncionarioReajusteSalarial := TCasoUsoFuncionarioReajusteSalarial.Create(aFuncionario);
      try
         aFuncionarioReajusteSalarial.ReajustarSalario(fdBom);
         VlSalario := aFuncionario.Salario;
         Assert.AreEqual(2300.00, VlSalario);
      finally
         aFuncionarioReajusteSalarial.Destroy;
      end;
   finally
      aFuncionario.Destroy;
   end;
end;

procedure TCasoUsoFuncionarioReajusteSalarialTeste.TestarReajusteSalariaDe20PorCentoSeDesempenhoForOtimo;
var aFuncionario : TEntidadeFuncionario;
    aFuncionarioReajusteSalarial : TCasoUsoFuncionarioReajusteSalarial;
    VlSalario : Double;
begin
   aFuncionario := TEntidadeFuncionario.Create('Jhoni Conzatti', 0, 2000);
   try
      aFuncionarioReajusteSalarial := TCasoUsoFuncionarioReajusteSalarial.Create(aFuncionario);
      try
         aFuncionarioReajusteSalarial.ReajustarSalario(fdOtimo);
         VlSalario := aFuncionario.Salario;
         Assert.AreEqual(2400.00, VlSalario);
      finally
         aFuncionarioReajusteSalarial.Destroy;
      end;
   finally
      aFuncionario.Destroy;
   end;
end;

initialization
  TDUnitX.RegisterTestFixture(TCasoUsoFuncionarioReajusteSalarialTeste);
end.
