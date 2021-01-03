program GrammerInterface;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  GrammarChecker in 'GrammarChecker.pas',
  Document in 'Document.pas';

var
  Document: TDocument;
begin
  ReportMemoryLeaksOnShutdown := True;
  try
    Document := TDocument.Create('This is the document text');
    try
      Document.CheckGrammer;
      Document.GrammerChecker := TRealGrammarChecker.Create;
      Document.CheckGrammer;
//      Document.GrammerChecker := nil;
    finally
      Document.Free;
    end;
    ReadLn;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
