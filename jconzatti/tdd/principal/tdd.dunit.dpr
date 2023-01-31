program tdd.dunit;

{$IFNDEF TESTINSIGHT}
{$APPTYPE CONSOLE}
{$ENDIF}{$STRONGLINKTYPES ON}
uses
  System.SysUtils,
  {$IFDEF TESTINSIGHT}
  TestInsight.DUnitX,
  {$ENDIF }
  DUnitX.Loggers.Console,
  DUnitX.Loggers.Xml.NUnit,
  DUnitX.TestFramework,
  UJconzatti.TDD.CasoUso.Calculadora.Teste in '..\casouso\teste\UJconzatti.TDD.CasoUso.Calculadora.Teste.pas',
  UJconzatti.TDD.CasoUso.Calculadora in '..\casouso\UJconzatti.TDD.CasoUso.Calculadora.pas',
  UJconzatti.TDD.CasoUso.Funcionario.Bonus.Teste in '..\casouso\teste\UJconzatti.TDD.CasoUso.Funcionario.Bonus.Teste.pas',
  UJconzatti.TDD.CasoUso.Funcionario.Bonus in '..\casouso\UJconzatti.TDD.CasoUso.Funcionario.Bonus.pas',
  UJconzatti.TDD.Entidade.Funcionario in '..\entidade\UJconzatti.TDD.Entidade.Funcionario.pas',
  UJconzatti.TDD.CasoUso.Funcionario.ReajusteSalarial.Teste in '..\casouso\teste\UJconzatti.TDD.CasoUso.Funcionario.ReajusteSalarial.Teste.pas',
  UJconzatti.TDD.Entidade.Funcionario.Desempenho in '..\entidade\UJconzatti.TDD.Entidade.Funcionario.Desempenho.pas',
  UJconzatti.TDD.CasoUso.Funcionario.ReajusteSalarial in '..\casouso\UJconzatti.TDD.CasoUso.Funcionario.ReajusteSalarial.pas';

var
  runner : ITestRunner;
  results : IRunResults;
  logger : ITestLogger;
  nunitLogger : ITestLogger;
begin
{$IFDEF TESTINSIGHT}
  TestInsight.DUnitX.RunRegisteredTests;
  exit;
{$ENDIF}
  try
    //Check command line options, will exit if invalid
    TDUnitX.CheckCommandLine;
    //Create the test runner
    runner := TDUnitX.CreateRunner;
    //Tell the runner to use RTTI to find Fixtures
    runner.UseRTTI := True;
    //tell the runner how we will log things
    //Log to the console window
    logger := TDUnitXConsoleLogger.Create(true);
    runner.AddLogger(logger);
    //Generate an NUnit compatible XML File
    nunitLogger := TDUnitXXMLNUnitFileLogger.Create(TDUnitX.Options.XMLOutputFile);
    runner.AddLogger(nunitLogger);
    runner.FailsOnNoAsserts := False; //When true, Assertions must be made during tests;

    //Run tests
    results := runner.Execute;
    if not results.AllPassed then
      System.ExitCode := EXIT_ERRORS;

    {$IFNDEF CI}
    //We don't want this happening when running under CI.
    if TDUnitX.Options.ExitBehavior = TDUnitXExitBehavior.Pause then
    begin
      System.Write('Done.. press <Enter> key to quit.');
      System.Readln;
    end;
    {$ENDIF}
  except
    on E: Exception do
      System.Writeln(E.ClassName, ': ', E.Message);
  end;
end.
