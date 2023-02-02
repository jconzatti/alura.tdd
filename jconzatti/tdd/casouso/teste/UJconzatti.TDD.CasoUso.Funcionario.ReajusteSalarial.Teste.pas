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
   private
    FFuncionario : TEntidadeFuncionario;
    FFuncionarioReajusteSalarial : TCasoUsoFuncionarioReajusteSalarial;
   public
      [Setup]
      procedure Inicializar;
      [TearDown]
      procedure Finalizar;
      [Test]
      procedure TestarReajusteSalarialDe3PorCentoSeDesempenhoForADesejar;
      [Test]
      procedure TestarReajusteSalarialDe15PorCentoSeDesempenhoForBom;
      [Test]
      procedure TestarReajusteSalarialDe20PorCentoSeDesempenhoForOtimo;
   end;

implementation


{ TCasoUsoFuncionarioReajusteSalarialTeste }

procedure TCasoUsoFuncionarioReajusteSalarialTeste.Inicializar;
begin
   FFuncionario := TEntidadeFuncionario.Create('Jhoni Conzatti', 0, 2033.57);
   FFuncionarioReajusteSalarial := TCasoUsoFuncionarioReajusteSalarial.Create(FFuncionario);
end;

procedure TCasoUsoFuncionarioReajusteSalarialTeste.Finalizar;
begin
   FFuncionarioReajusteSalarial.Destroy;
   FFuncionario.Destroy;
end;

procedure TCasoUsoFuncionarioReajusteSalarialTeste.TestarReajusteSalarialDe3PorCentoSeDesempenhoForADesejar;
var VlSalario : Double;
begin
   FFuncionarioReajusteSalarial.ReajustarSalario(fdADesejar);
   VlSalario := FFuncionario.Salario;
   Assert.AreEqual(2094.58, VlSalario);
end;

procedure TCasoUsoFuncionarioReajusteSalarialTeste.TestarReajusteSalarialDe15PorCentoSeDesempenhoForBom;
var VlSalario : Double;
begin
   FFuncionarioReajusteSalarial.ReajustarSalario(fdBom);
   VlSalario := FFuncionario.Salario;
   Assert.AreEqual(2338.61, VlSalario);
end;

procedure TCasoUsoFuncionarioReajusteSalarialTeste.TestarReajusteSalarialDe20PorCentoSeDesempenhoForOtimo;
var VlSalario : Double;
begin
   FFuncionarioReajusteSalarial.ReajustarSalario(fdOtimo);
   VlSalario := FFuncionario.Salario;
   Assert.AreEqual(2440.28, VlSalario);
end;

initialization
  TDUnitX.RegisterTestFixture(TCasoUsoFuncionarioReajusteSalarialTeste);
end.
