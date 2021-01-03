unit GrammarChecker;

interface

type
  IGrammarChecker = interface
    ['{11F35265-4CFE-4920-9AAF-0EB69B0A7A91}']
    procedure CheckGrammar;
  end;

  TDefaultGrammarChecker = class(TInterfacedObject, IGrammarChecker)
    procedure CheckGrammar;
  end;

  TRealGrammarChecker = class(TInterfacedObject, IGrammarChecker)
    procedure CheckGrammar;
  end;

implementation

{ TRealGrammarChecker }

procedure TDefaultGrammarChecker.CheckGrammar;
begin
  Writeln('Do nothing');
end;

procedure TRealGrammarChecker.CheckGrammar;
begin
  Writeln('Grammar has been checked');
end;

end.
