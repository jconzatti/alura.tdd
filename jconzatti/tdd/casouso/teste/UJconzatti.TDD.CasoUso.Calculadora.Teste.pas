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
      [TestCase('Soma dois valores positivos','3,7')]
      [TestCase('Soma zero a um valor positivo','0,7')]
      [TestCase('Soma um valor positivo a zero','3,0')]
      [TestCase('Soma dois valores negativos','-3,-7')]
      [TestCase('Soma zero a um valor negativo','0,-7')]
      [TestCase('Soma um valor negativo a zero','-3,0')]
      [TestCase('Soma zeros','0,0')]
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
