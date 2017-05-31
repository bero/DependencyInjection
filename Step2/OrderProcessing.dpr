program OrderProcessing;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  ProcessOrder in '..\Step1\ProcessOrder.pas';

begin
  try
    DoOrderProcessing;
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
