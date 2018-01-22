program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

const ships = 20;
  type
TP2F = array[1..10, 1..10] of Char;
var P2F:TP2F;
 var ib,jb,ie,je,i,j,k,ship_size,ship_amount,direction,n:Integer ;
 var exiter,exc:Boolean;
 function Quick_math(x,y:integer):boolean;
 var count:integer;
  begin
  count:=0;
   if
     (P2F[x-1,y]='K') or (P2F[x,y-1]='K') or (P2F[x-1,y-1]='K')
      or (P2F[x+1,y]='K') or (P2F[x,y+1]='K') or (P2F[x+1,y+1]='K')
      or (P2F[x+1,y-1]='K')or (P2F[x-1,y+1]='K')  then
   Quick_math:=true
   else quick_math:=false;
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
  for k := 1 to 4 do
  begin

    for j := 1 to ship_amount do
    begin
    repeat
      exiter:=False;
      repeat
        ib:=Random(n)+1;
        jb:=Random(n)+1;
      until not(quick_math(ib,jb)) or ( (jb+ship_size-1>10) or (ib+ship_size-1>10)) ;
      direction:=random(2)+1;             //1-Right 2-Bottom 3-Left 4-up
      if ship_size>1 then
      begin
      case direction of
      1:
      if  (ib+ship_size-1<=10) then
        begin

        exc:=True;
        for I := 1 to ship_size-1 do
        if Quick_math(ib+i,jb) then
        exc:=False;
         if exc  then
         for I := 1 to ship_size-1 do
         begin
         P2F[ib,jb]:='K';
         P2F[ib+i,jb]:='K';
         exiter:=true;
         end;


        end;
      2:
      if   (jb+ship_size-1<=10)then
        begin
         exc:=True;
        for I := 1 to ship_size-1 do
        if Quick_math(ib,jb+i) then
        exc:=False;
         if exc  then

         for I := 1 to ship_size-1 do
         begin
          P2F[ib,jb]:='K';
          P2F[ib,jb+i]:='K';
          exiter:=true;

         end
        end;                                                                      //1-Right 2-Bottom 3-Left 4-up
        end;
        end
      else begin
      P2F[ib,jb]:='K';
      exiter:=true;
      end;
    until(exiter) ;
    end;
    inc(ship_amount);
    dec(ship_size);

  {   for I := 1 to n do
  begin
    for j := 1 to n do
      write (P2F[i,j]);
      writeln;
  end;    }




  end;

 for I := 1 to n do
  begin
    for j := 1 to n do
      write (P2F[i,j]);
      writeln;
  end;
  Readln;
end.
