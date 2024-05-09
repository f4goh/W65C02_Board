var i : integer;
begin
  pinmode (4, 1);
  for i := 1 to 10 do
    begin
    digitalwrite (4, 1);
    delay (1000);
    digitalwrite (4, 0);
    delay (1000);
    end
end .
