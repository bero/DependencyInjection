program PaintGun;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  VCL.Graphics,
  PaintGunInterfaces in 'PaintGunInterfaces.pas';

var
  PaintingRobot: TCarPaintingRobot;
  GunTip, GunTip2: TPaintGunTip;
begin
  ReportMemoryLeaksOnShutdown := True;
  try
    GunTip := TPaintGunTip.Create;
    GunTip2 := TPaintGunTip.Create;
    PaintingRobot := TCarPaintingRobot.Create;
    try
      PaintingRobot.PaintCar(clRed, GunTip);
      PaintingRobot.PaintCar(clBlack, GunTip2);
    finally
      PaintingRobot.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  ReadLn;
end.
