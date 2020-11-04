
$hour=0
$sec=0
$min=0
$min1=0
n=0

while n!=120 do
  $min1=($min*100)/60;
  if $sec==60
    $sec=0
    $min+=1
    if $min==60
      $min=0
      $min1=0
      $hour+=1
      if $hour==60
        $hour=0
      end
    end
  end
  puts "#$hour:#$min1:#$sec"
  sleep (1)
  $sec+=1
  n+=1
end
