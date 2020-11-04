#=>state // датчик состояния (ST_OFF(0), ST_ON(1)) (активен ли сейчас этот блок?)
#=>chan_count // количество каналов (0-5)
#=>chan_exec // выбранный канал(0-chan_count)
#=>filter // есть ли фильтр (ST_NOT(0), ST_YES(1)) (для преобразования угловых скоростей в другую систему координат)
#=>point_180  // датчик угла отклоенния (0-180)

#=>cd /D D:\github\projectLaba
#=>shoes laba.rb
def macros(x)
  (250-x*230/180)
end

prng = Random.new
$state=prng.rand(2)
$chan_count=prng.rand(1..5)
$chan_exec=prng.rand(1..$chan_count)
$filter=prng.rand(2)
$point_180=prng.rand(180)
$x1
$y1
$x2=20
$y2=$point_180
$call=1
#=>puts "#$r"

Shoes.app(:title => 'Информационный блок', :width => 800, :height => 530, :resizable => true) do
  background "#ffffff"
  flow margin_left: 580, margin_top: 10 , margin_bottom: 10 do
    if $state==0
      fill red
      oval(top: 6, radius: 8)
      @note1 = para "Блок не задействован\n", left: margin_left+15, stroke: "#ff2e00", font: "Gothic"
    else
      fill green
      oval(top: 6, radius: 8)
      @note1 = para "Блок задействован\n", left: margin_left+15, stroke: "#1fff43", font: "Gothic"
    end
#=>  @note2 = para "#$chan_count\n"
#=>  @note3 = para "#$chan_exec\n"
    if $filter==0
      fill red
      oval(top: 28, radius: 8)
      @note2 = para "Фильтр не используется", left: margin_left+15, stroke: "#ff2e00", font: "Gothic"
    else
      fill green
      oval(top: 28, radius: 8)
      @note2 = para "Фильтр используется", left: margin_left+15, stroke: "#1fff43", font: "Gothic"
    end

  end
  @note3 = para "Измерения датчика",  stroke: "#1fff43", font: "Gothic"
  flow width: 800, height: 348 do
    background "D:/github/projectLaba/21321.png"
  end
  every (1) {
    strokewidth 2
    stroke "#1fff43".."#000000"
    fill "#000000"
    if $call!=10
    $x1=$x2
    $y1=$y2
    $x2=$x1+75.5
    $point_180=prng.rand(180)
    $y2=$point_180
    @hui=line($x1,macros($y1),$x2,macros($y2))
    @hui=oval($x1-4,macros($y1)-4, radius: 4)
    $call+=1
    end
    oval($x2-4,macros($y2)-4, radius: 4)
    }
end
