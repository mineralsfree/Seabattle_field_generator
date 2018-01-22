program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const ships = 20;
  type
TP2F = array[1..10, 1..10] of Char;
var P2F:TP2F;
 var ib,jb,ie,je,i,j,ship_size,ship_amount,direction,n:Integer ;
 var exiter:Boolean;
 function Quick_math(x,y:integer):boolean;
 var count:integer;
  begin
  count:=0;
   if     (P2F[x-1,y]='K') and (P2F[x,y-1]='K') and (P2F[x-1,y-1]='K')
      and (P2F[x+1,y]='K') and (P2F[x,y+1]='K') and (P2F[x+1,y+1]='K')
      and (P2F[x+1,y-1]='K')and (P2F[x-1,y+1]='K')  then
   inc(count);
   if count<=2 then
   Quick_math:=true;

 end;
 begin
 n:=10;
 for I := 1 to n do
   for j := 1 to n do
     P2F[i,j]:=' ';

 Randomize;
 exiter:=False;
 Ship_size:=4;
 ship_amount:=1;
  repeat

    for j := 1 to ship_amount do
    begin
    repeat
      repeat
        ib:=Random(n)+1;
        jb:=Random(n)+1;
      until  ((P2F[ib,jb])<>'K')
      and (P2F[ib-1,jb]<>'K') and (P2F[ib,jb-1]<>'K') and (P2F[ib-1,jb-1]<>'K')
      and (P2F[ib+1,jb]<>'K') and (P2F[ib,jb+1]<>'K') and (P2F[ib+1,jb+1]<>'K')
      and (P2F[ib+1,jb-1]<>'K')and (P2F[ib-1,jb+1]<>'K');
      direction:=random(2)+1;             //1-Right 2-Bottom 3-Left 4-up
      case direction of
      1:
      if (P2F[ib+ship_size-1,jb]=' ') then
        begin
        P2F[ib,jb]:='K';
        for I := 1 to ship_size-1 do
        if Quick_math(ib+i,jb) then
        P2F[ib+i,jb]:='K';
        exiter:=true;
        end;
      2:
      if  (P2F[ib,jb+ship_size-1]=' ')then
        begin
        P2F[ib,jb]:='K';
        for I := 1 to ship_size-1 do
        if Quick_math(ib,jb+i) then
        P2F[ib,jb+i]:='K';
        exiter:=true;                                                                      //1-Right 2-Bottom 3-Left 4-up
        end;
      end;
    until(exiter) ;
   end;
    inc(ship_amount);
    dec(ship_size);
  until (ship_amount=5);
  for I := 1 to n do
  begin
    for j := 1 to n do
      write (P2F[i,j]);
      writeln;
  end;
  Readln;
end.
