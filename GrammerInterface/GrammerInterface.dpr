program GrammerInterface;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  GrammarChecker in 'GrammarChecker.pas',
  Document in 'Document.pas';

var
  fDoc: TDocument;
begin
  try
    fDoc := TDocument.Create('Test');
    try
      fdoc.GrammerChecker := TRealGrammarChecker.Create;
      fDoc.CheckGrammer;
    finally
      fDoc.Free;
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
