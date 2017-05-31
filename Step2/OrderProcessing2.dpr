program OrderProcessing2;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ProcessOrder in '..\Step2\ProcessOrder.pas';

begin
  try
    DoOrderProcessing;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
