program tdd.linha.comando;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

begin
   try
   except
      on E: Exception do
         Writeln(E.ClassName, ': ', E.Message);
   end;
end.
