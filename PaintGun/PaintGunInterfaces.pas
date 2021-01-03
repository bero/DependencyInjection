unit PaintGunInterfaces;

interface

uses
  VCL.Graphics;

type
  IPaintGunTip = interface
    procedure SprayCar(aColor: TColor);
  end;

  TPaintGunTip = class(TInterfacedObject, IPaintGunTip)
    procedure SprayCar(aColor: TColor);
  end;

  TCarPaintingRobot = class
  public
    procedure PaintCar(aColor: TColor; aPaintGunTip: IPaintGunTip);
  end;

implementation

uses
  SysUtils;

procedure TPaintGunTip.SprayCar(aColor: TColor);
begin
  Writeln('Spray car with ' + ColorToString(aColor));
end;

procedure TCarPaintingRobot.PaintCar(aColor: TColor; aPaintGunTip: IPaintGunTip);
begin
  aPaintGunTip.SprayCar(aColor);
end;

end.
