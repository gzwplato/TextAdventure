unit KampfProzedure;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
var
  SpielerHP, SpielerRK, SpielerATK: Integer;  //Angelehnt an das Pen&Paper-Kampfsystem//
  IstInKampf: Boolean;
procedure Kampf();
implementation
procedure Kampf();
begin
  SpielerHP:=SpielerHP-1
  end;
end.

