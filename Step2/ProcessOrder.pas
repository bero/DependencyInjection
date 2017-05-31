{*****************************************
*                                        *
* Step by step from tightly coupled code *
* to dependency injection                *
*                                        *
******************************************}

unit ProcessOrder;

interface

type
  TOrder = class

  end;

  TOrderEntry = class
  public
    function EnterOrderIntoDatabase(aOrder: TOrder): Boolean;
  end;

  TOrderValidator = class
  public
    function ValidateOrder(aOrder: TOrder): Boolean;
  end;

  TOrderProcessor = class
  private
    fOrdervalidator: TOrderValidator;
    fOrderEntry: TOrderEntry;
  public
    constructor Create(aOrdervalidator: TOrderValidator; aOrderEntry: TorderEntry);
    destructor Destroy; override;
    function ProcessOrder(aOrder: TOrder): Boolean;
  end;

procedure DoOrderProcessing;

implementation

procedure DoOrderProcessing;
var
  Order: TOrder;
  OrderProcessor: TOrderProcessor;
  OrderValidator: TOrderValidator;
  OrderEntry: TOrderEntry;
begin
  Order := TOrder.Create;
  try
    OrderValidator := TOrderValidator.Create;
    OrderEntry := TOrderEntry.Create;
    OrderProcessor := TOrderProcessor.Create(OrderValidator, OrderEntry);
    try
      if OrderProcessor.ProcessOrder(Order) then
        Writeln('Order successfully processed...');
    finally
      OrderProcessor.Free;
    end;
  finally
    Order.Free;
  end;
end;


constructor TOrderProcessor.Create(aOrdervalidator: TOrderValidator; aOrderEntry: TorderEntry);
begin
  FOrderValidator := aOrdervalidator;
  FOrderEntry := aOrderEntry;
end;

destructor TOrderProcessor.Destroy;
begin
  FOrderValidator.free;
  FOrderEntry.free;
  inherited;
end;

function TOrderProcessor.ProcessOrder(aOrder: TOrder): Boolean;
begin
  Result := FOrderValidator.ValidateOrder(aOrder) and FOrderEntry.EnterOrderIntoDatabase(aOrder);
  WriteLn('Order has been processed...');
end;

{ TOrderValidator }

function TOrderValidator.ValidateOrder(aOrder: TOrder): Boolean;
begin
  Result := True;
end;

{ TOrderEntry }

function TOrderEntry.EnterOrderIntoDatabase(aOrder: TOrder): Boolean;
begin
  Result := True;
end;

end.
