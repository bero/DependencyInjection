unit Document;

interface

uses
  GrammarChecker;

type
  TDocument = class
  private
    fText: String;
    fGrammarChecker: IGrammarChecker;
    procedure SetGrammarChecker(const Value: IGrammarChecker);
  public
    constructor Create(const aText: String);
    procedure CheckGrammer;
    property Text: string read fText write fText;
    property GrammerChecker: IGrammarChecker read fGrammarChecker write SetGrammarChecker;
  end;

implementation

uses
  SysUtils;

procedure TDocument.CheckGrammer;
begin
  fGrammarChecker.CheckGrammar;
end;

constructor TDocument.Create(const aText: String);
begin
  inherited Create;
  ftext := aText;
  fGrammarChecker := TDefaultGrammarChecker.Create;
end;

procedure TDocument.SetGrammarChecker(const Value: IGrammarChecker);
begin
  if not Assigned(Value) then
    raise Exception.CreateFmt('Value in %s.SetGrammarChecker is nil', [classname]);

  fGrammarChecker := Value;
end;

end.
