#state // датчик состояния (ST_OFF(0), ST_ON(1)) (активен ли сейчас этот блок?)
#chan_count // количество каналов (0-5)
#chan_exec // выбранный канал(0-chan_count)
#filter // есть ли фильтр (ST_NOT(0), ST_YES(1)) (для преобразования угловых скоростей в другую систему координат)
#point_180  // датчик угла отклоенния (0-180)

#cd /D D:\github\projectLaba
#shoes laba.rb
def macros(x)
  250-x*230/180
end

prng = Random.new
$state=prng.rand(2)
$chan_count=prng.rand(1..5)
$filter=prng.rand(2)
$point_180=prng.rand(180)
$x1
$y1
$x2=20
$y2=$point_180
$call=1
$Fx
$x=31

Shoes.app(:title => 'Информационный блок', :width => 800, :height => 850, :resizable => true) do
  background "#040a0d"
  @note3 = para "Количество каналов: #$chan_count", left: 15, top: 5, stroke: "#e4e4e4", font: "Gothic", size: 15
  @TbIK = button "Показать выбранный канал", left: 19, top: 40, width: 211
  @TbIK.click do
   $chan_exec=prng.rand(1..$chan_count)
   fill white
   @dom = rect(left: 240, top: 15, width: 54, height: 65)
   @note4 = para $chan_exec, left: 245, top: 8, stroke: black, size: 50
   @Clear = button "Очистить", left: 300, top: 16, width: 80
   @Clear.click do
     @note4.stroke = "#040a0d"
     @dom.fill = "#040a0d"
     @dom.stroke = "#040a0d"
    end
  end
  @note5 = para "Датчик расхода топлива", stroke: "#e4e4e4", top: 515, left: 230, width: 800, size: 22
  image "D:/github/projectLaba/1231.png", top: 560
  while $x!=782 do
   $Fx=814-Math.exp(-0.004*$x)*285
   oval($x, $Fx, radius: 1, stroke: black )
   $x=$x+1
  end
  flow margin_left: 580, margin_top: 28 do
    if $state==0
      fill red
      oval(top: 6, radius: 8)
      @note1 = para "Блок не задействован\n", left: margin_left+15, stroke: "#e4e4e4", font: "Gothic"
    else
      fill green
      oval(top: 6, radius: 8)
      @note1 = para "Блок задействован\n", left: margin_left+15, stroke: "#e4e4e4", font: "Gothic"
    end
    if $filter==0
      fill red
      oval(top: 28, radius: 8)
      @note2 = para "Фильтр не используется", left: margin_left+15, stroke: "#e4e4e4", font: "Gothic"
    else
      fill green
      oval(top: 28, radius: 8)
      @note2 = para "Фильтр используется", left: margin_left+15, stroke: "#e4e4e4", font: "Gothic"
    end
  end
  flow margin: 10 do
  para "Показатели датчика угла отклонения", left: 280, stroke: "#e4e4e4", font: "Microsoft Sans Serif", size: 20
  end
  flow width: 800, height: 348 do
    background "D:/github/projectLaba/21321.png"
  flow margin_left: 40, margin_right: 40, margin_bottom: 80, width: 800, height: 350 do
    strokewidth 2
    stroke "#1fff43".."#000000"
    fill "#000000"
    while $call!=10 do
    $x1=$x2
    $y1=$y2
    $x2=$x1+75.5
    $point_180=prng.rand(180)
    $y2=$point_180
    line($x1,macros($y1),$x2,macros($y2))
    oval($x1-4,macros($y1)-4, radius: 4)
    $call+=1
    end
    oval($x2-4,macros($y2)-4, radius: 4)
  end
  end
end
