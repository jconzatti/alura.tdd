unit UJconzatti.TDD.CasoUso.Calculadora.Teste;

interface

uses
   DUnitX.TestFramework,
   UJconzatti.TDD.CasoUso.Calculadora;

type
   [TestFixture]
   TCasoUsoCalculadoraTeste = class
   private
      FCalculadora : TCasoUsoCalculadora;
   public
      [Setup]
      procedure Inicializacao;
      [TearDown]
      procedure Finalizacao;
      [Test]
      [TestCase('SomaDoisValoresPositivos','3,7')]
      [TestCase('SomaZeroEUMValorPositivo','0,7')]
      [TestCase('SomaUmValorPositivoEZero','3,0')]
      [TestCase('SomaDoisValoresNegativos','-3,-7')]
      [TestCase('SomaZeroEUmValorNegativo','0,-7')]
      [TestCase('SomaUmValorNegativoEZero','-3,0')]
      [TestCase('SomaDoisZeros','0,0')]
      procedure TestarSoma(const a, b : Integer);
   end;

implementation

procedure TCasoUsoCalculadoraTeste.Inicializacao;
begin
   FCalculadora := TCasoUsoCalculadora.Create;
end;

procedure TCasoUsoCalculadoraTeste.TestarSoma(const a, b: Integer);
var s : Integer;
begin
   s := FCalculadora.Somar(a,b);
   Assert.AreEqual(s, a+b);
end;

procedure TCasoUsoCalculadoraTeste.Finalizacao;
begin
   FCalculadora.Destroy;
end;

initialization
   TDUnitX.RegisterTestFixture(TCasoUsoCalculadoraTeste);

end.
