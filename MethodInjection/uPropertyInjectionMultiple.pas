unit uPropertyInjectionMultiple;

interface

type
  TReciepe = class
  private
    fText: string;
  public
    property Text: string read fText write fText;
  end;

  IFoodPreparer = interface
    procedure PrepareFood(aReciepe: TReciepe);
  end;

  TBaker = class(TInterfacedObject, IFoodPreparer)
    procedure PrepareFood(aReciepe: TReciepe);
  end;

  TShortOrderCook = class(TInterfacedObject, IFoodPreparer)
    procedure PrepareFood(aReciepe: TReciepe);
  end;

  TChef = class(TInterfacedObject, IFoodPreparer)
    procedure PrepareFood(aReciepe: TReciepe);
  end;

  TResturant = class
  private
    fName: string;
  public
    constructor Create(const aName: string);
    procedure PrepareFood(aReciepe: TReciepe; aPreparer: IFoodPreparer);
    property Name: string read fName;
  end;

implementation

constructor TResturant.Create(const aName: string);
begin
  fName := aName;
end;

procedure TResturant.PrepareFood(aReciepe: TReciepe; aPreparer: IFoodPreparer);
begin
  aPreparer.PrepareFood(aReciepe);
end;

procedure TBaker.PrepareFood(aReciepe: TReciepe);
begin
  WriteLn('Use baking skills to do the following: ' + aReciepe.Text);
end;

procedure TShortOrderCook.PrepareFood(aReciepe: TReciepe);
begin
  WriteLn('Use the grill to do the following: ' + aReciepe.Text);
end;

procedure TChef.PrepareFood(aReciepe: TReciepe);
begin
  WriteLn('Use the well trained culinary skills to do the following: ' + aReciepe.Text);
end;

end.
