unit ProzedureRaumwechsel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,mTRaum,KampfProzedure;
var
 aktuellerRaum: TRaum;
 vorherigerRaum: TRaum;
procedure RaumWechsel(Eingabe:Traum);
implementation
uses Unit1,UIRefresh,Monsterspawn;
procedure RaumWechsel(Eingabe:Traum);
var
WuerfelErgebnis:Integer;
   begin
   if Eingabe = nil        //Prozedur wird mit Eingabe als Nördlicher Raum übergeben
   then Form1.Memo1.lines.add('Da ist kein Raum!')
   else
     if IstInKampf = true  then
     begin
     Form1.Memo1.lines.add('Du bist in einem Kampf und kannst nur flüchten oder Angreifen')
     end
     else
     begin
      if uppercase(Unit1.Eingabe) = 'NORDEN' then
      Form1.Memo1.lines.add(aktuellerRaum.NORDENLeave)
      else if uppercase(Unit1.Eingabe) = 'OSTEN' then
      Form1.Memo1.lines.add(aktuellerRaum.OSTENLeave)
      else if (uppercase(Unit1.Eingabe) = 'SÜDEN') or   (uppercase(Unit1.Eingabe) = 'SUEDEN') then
      Form1.Memo1.lines.add(aktuellerRaum.SUEDENLeave)
      else if uppercase(Unit1.Eingabe) = 'WESTEN' then
      Form1.Memo1.lines.add(aktuellerRaum.WESTENLeave);
      vorherigerRaum:=aktuellerRaum;
      aktuellerRaum:=Eingabe;
      Form1.Memo1.lines.add('Du betritts: '+Eingabe.Raumname);
      AktuellerRaum.MD:=AktuellerRaum.MD+ AktuellerRaum.Schrittweite*AktuellerRaum.MDA;
      Wuerfelergebnis:= 1+random(100);
      if WuerfelErgebnis-aktuellerRaum.MD<=0 then
         Monsterspawn.Monsterspawn();
      if AktuellerRaum.Enemy <> nil then
      begin
      IstInKampf:=true;
      AktuellerGegner:=AktuellerRaum.Enemy;
      SpielerRK:=SPielerRK -2;
      SpielerATK:=SPielerATK -2;
      Kampf();                      //Ersatz für das Initative System
      SpielerATK:=SPielerATK +2;    //Bei Betreten eines Raumes mit einem Gegner
      SpielerRK:=SpielerRK +2;      //Wird dem Spieler 2 RK abgezogen
      UIRefresh.UIRefresh();

      //Raum1.Schriitweite:=Raum1.Schrittweite +1
      //Raum2.Schriitweite:=Raum2.Schrittweite +1  Entsprechend fortührend
     //                                            Muss hard coded werden
      end;
  end;
end;

end.
