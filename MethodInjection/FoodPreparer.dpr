program FoodPreparer;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  uPropertyInjectionMultiple in 'uPropertyInjectionMultiple.pas';

var
  Resturant: TResturant;
  Baker: TBaker;
  ShortOrderCook: TShortOrderCook;
  Chef: TChef;
  Reciepe: TReciepe;
begin
  try
    Resturant := TResturant.Create('Attracs');
    Baker := TBaker.Create;
    ShortOrderCook := TShortOrderCook.Create;
    Chef := TChef.Create;
    Reciepe := TReciepe.Create;
    try
      Reciepe.Text := 'Cake';
      Resturant.PrepareFood(Reciepe, Baker);

      Reciepe.Text := 'Food';
      Resturant.PrepareFood(Reciepe, ShortOrderCook);

      Reciepe.Text := 'Drink';
      Resturant.PrepareFood(Reciepe, Chef);
      ReadLn;
    finally
      Reciepe.Free;
      Resturant.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
