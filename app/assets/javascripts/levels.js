var lvlnum=1;
var string="";
var stringarray=[];
$(document).ready(function(){
  $("#levelbutton").click(function(){
  if(lvlnum==1){
    create()
    for(var li=1;li<12; li++){
      $("div[id='id "+li+" 5']").removeClass().addClass("wall")
    }
    for(var li=1;li<12; li++){
      if(li!=6)
      $("div[id='id "+li+" 7']").removeClass().addClass("wall")
    }
    $("div[id='id 6 8']").removeClass().addClass("wall")
    $("div[id='id 1 6']").removeClass().addClass("srb")
    $("div[id='id 11 6']").removeClass().addClass("sgb")
    $("div[id='id 4 6']").removeClass().addClass("sgh")
    $("div[id='id 8 6']").removeClass().addClass("srh")
   };
   if(lvlnum==2){
     create()
      $("div[id='id 1 7']").removeClass().addClass("wall");
      $("div[id='id 1 6']").removeClass().addClass("wall");
      $("div[id='id 1 5']").removeClass().addClass("wall");
      $("div[id='id 2 4']").removeClass().addClass("wall");
      $("div[id='id 3 3']").removeClass().addClass("wall");
      $("div[id='id 4 3']").removeClass().addClass("wall");
      $("div[id='id 5 3']").removeClass().addClass("wall");
      $("div[id='id 6 4']").removeClass().addClass("wall");
      $("div[id='id 7 3']").removeClass().addClass("wall");
      $("div[id='id 8 3']").removeClass().addClass("wall");
      $("div[id='id 9 3']").removeClass().addClass("wall");
      $("div[id='id 10 4']").removeClass().addClass("wall");
      $("div[id='id 11 5']").removeClass().addClass("wall");
      $("div[id='id 11 6']").removeClass().addClass("wall");
      $("div[id='id 11 7']").removeClass().addClass("wall");
      $("div[id='id 10 8']").removeClass().addClass("wall");
      $("div[id='id 9 9']").removeClass().addClass("wall");
      $("div[id='id 8 9']").removeClass().addClass("wall");
      $("div[id='id 7 9']").removeClass().addClass("wall");
      $("div[id='id 6 8']").removeClass().addClass("wall");
      $("div[id='id 5 9']").removeClass().addClass("wall");
      $("div[id='id 4 9']").removeClass().addClass("wall");
      $("div[id='id 3 9']").removeClass().addClass("wall");
      $("div[id='id 2 8']").removeClass().addClass("wall");
      $("div[id='id 3 6']").removeClass().addClass("wall");
      $("div[id='id 4 7']").removeClass().addClass("wall");
      $("div[id='id 4 5']").removeClass().addClass("wall");
      $("div[id='id 5 6']").removeClass().addClass("wall");
      $("div[id='id 7 6']").removeClass().addClass("wall");
      $("div[id='id 8 5']").removeClass().addClass("wall");
      $("div[id='id 8 7']").removeClass().addClass("wall");
      $("div[id='id 9 6']").removeClass().addClass("wall");
      $("div[id='id 2 6']").removeClass().addClass("srh");
      $("div[id='id 10 6']").removeClass().addClass("sgh");
      $("div[id='id 6 5']").removeClass().addClass("srb");
      $("div[id='id 6 7']").removeClass().addClass("sgb");
   };
  if(lvlnum==3){
    create()
      $("div[id='id 11 11']").removeClass().addClass("svh");
      $("div[id='id 10 11']").removeClass().addClass("sth");
      $("div[id='id 9 11']").removeClass().addClass("syh");
      $("div[id='id 8 11']").removeClass().addClass("sbh");
      $("div[id='id 7 11']").removeClass().addClass("sgh");
      $("div[id='id 6 11']").removeClass().addClass("srh");
      $("div[id='id 6 1']").removeClass().addClass("srb");
      $("div[id='id 5 1']").removeClass().addClass("sgb");
      $("div[id='id 4 1']").removeClass().addClass("sbb");
      $("div[id='id 3 1']").removeClass().addClass("syb");
      $("div[id='id 1 1']").removeClass().addClass("svb");
      $("div[id='id 2 1']").removeClass().addClass("stb");
      $("div[id='id 6 6']").removeClass().addClass("wall");
   };
  if(lvlnum==4){
    create()
      $("div[id='id 1 1']").removeClass().addClass("srh");
      $("div[id='id 1 2']").removeClass().addClass("syh");
      $("div[id='id 1 3']").removeClass().addClass("sgh");
      $("div[id='id 1 4']").removeClass().addClass("sth");
      $("div[id='id 1 5']").removeClass().addClass("sbh");
      $("div[id='id 1 6']").removeClass().addClass("svh");
      $("div[id='id 2 1']").removeClass().addClass("wall");
      $("div[id='id 2 2']").removeClass().addClass("wall");
      $("div[id='id 2 3']").removeClass().addClass("wall");
      $("div[id='id 2 4']").removeClass().addClass("wall");
      $("div[id='id 2 5']").removeClass().addClass("wall");
      $("div[id='id 2 6']").removeClass().addClass("wall");
      $("div[id='id 2 7']").removeClass().addClass("wall");
      $("div[id='id 2 8']").removeClass().addClass("wall");
      $("div[id='id 2 9']").removeClass().addClass("wall");
      $("div[id='id 2 10']").removeClass().addClass("wall");
      $("div[id='id 3 10']").removeClass().addClass("wall");
      $("div[id='id 4 10']").removeClass().addClass("wall");
      $("div[id='id 5 10']").removeClass().addClass("wall");
      $("div[id='id 7 10']").removeClass().addClass("wall");
      $("div[id='id 8 10']").removeClass().addClass("wall");
      $("div[id='id 9 10']").removeClass().addClass("wall");
      $("div[id='id 10 10']").removeClass().addClass("wall");
      $("div[id='id 6 10']").removeClass().addClass("wall");
      $("div[id='id 10 9']").removeClass().addClass("wall");
      $("div[id='id 10 8']").removeClass().addClass("wall");
      $("div[id='id 10 7']").removeClass().addClass("wall");
      $("div[id='id 10 6']").removeClass().addClass("wall");
      $("div[id='id 10 5']").removeClass().addClass("wall");
      $("div[id='id 10 4']").removeClass().addClass("wall");
      $("div[id='id 10 3']").removeClass().addClass("wall");
      $("div[id='id 10 2']").removeClass().addClass("wall");
      $("div[id='id 9 2']").removeClass().addClass("wall");
      $("div[id='id 8 2']").removeClass().addClass("wall");
      $("div[id='id 7 2']").removeClass().addClass("wall");
      $("div[id='id 6 2']").removeClass().addClass("wall");
      $("div[id='id 5 2']").removeClass().addClass("wall");
      $("div[id='id 4 2']").removeClass().addClass("wall");
      $("div[id='id 4 3']").removeClass().addClass("wall");
      $("div[id='id 4 4']").removeClass().addClass("wall");
      $("div[id='id 4 5']").removeClass().addClass("wall");
      $("div[id='id 4 6']").removeClass().addClass("wall");
      $("div[id='id 4 7']").removeClass().addClass("wall");
      $("div[id='id 4 8']").removeClass().addClass("wall");
      $("div[id='id 5 8']").removeClass().addClass("wall");
      $("div[id='id 6 8']").removeClass().addClass("wall");
      $("div[id='id 7 8']").removeClass().addClass("wall");
      $("div[id='id 8 8']").removeClass().addClass("wall");
      $("div[id='id 8 7']").removeClass().addClass("wall");
      $("div[id='id 8 6']").removeClass().addClass("wall");
      $("div[id='id 8 5']").removeClass().addClass("wall");
      $("div[id='id 8 4']").removeClass().addClass("wall");
      $("div[id='id 7 4']").removeClass().addClass("wall");
      $("div[id='id 6 4']").removeClass().addClass("wall");
      $("div[id='id 6 5']").removeClass().addClass("wall");
      $("div[id='id 6 6']").removeClass().addClass("wall");
      $("div[id='id 7 5']").removeClass().addClass("svb");
      $("div[id='id 7 6']").removeClass().addClass("sbb");
      $("div[id='id 7 7']").removeClass().addClass("stb");
      $("div[id='id 6 7']").removeClass().addClass("sgb");
      $("div[id='id 5 6']").removeClass().addClass("srb");
      $("div[id='id 5 7']").removeClass().addClass("syb");
   };
  if(lvlnum==5){
    create()
      $("div[id='id 1 5']").removeClass().addClass("wall");
      $("div[id='id 2 6']").removeClass().addClass("wall");
      $("div[id='id 11 5']").removeClass().addClass("wall");
      $("div[id='id 10 6']").removeClass().addClass("wall");
      $("div[id='id 2 5']").removeClass().addClass("srb");
      $("div[id='id 10 5']").removeClass().addClass("sgb");
      $("div[id='id 1 6']").removeClass().addClass("sgh");
      $("div[id='id 11 6']").removeClass().addClass("srh");
   };
  if(lvlnum==6){
    create()
      $("div[id='id 2 2']").removeClass().addClass("wall");
      $("div[id='id 10 10']").removeClass().addClass("wall");
      $("div[id='id 2 10']").removeClass().addClass("wall");
      $("div[id='id 3 9']").removeClass().addClass("wall");
      $("div[id='id 4 8']").removeClass().addClass("wall");
      $("div[id='id 5 7']").removeClass().addClass("wall");
      $("div[id='id 6 6']").removeClass().addClass("wall");
      $("div[id='id 7 5']").removeClass().addClass("wall");
      $("div[id='id 8 4']").removeClass().addClass("wall");
      $("div[id='id 9 3']").removeClass().addClass("wall");
      $("div[id='id 10 2']").removeClass().addClass("wall");
      $("div[id='id 4 9']").removeClass().addClass("svb");
      $("div[id='id 5 8']").removeClass().addClass("stb");
      $("div[id='id 6 7']").removeClass().addClass("syb");
      $("div[id='id 7 6']").removeClass().addClass("sbb");
      $("div[id='id 8 5']").removeClass().addClass("sgb");
      $("div[id='id 9 4']").removeClass().addClass("srb");
      $("div[id='id 8 3']").removeClass().addClass("srh");
      $("div[id='id 6 5']").removeClass().addClass("sbh");
      $("div[id='id 7 4']").removeClass().addClass("sgh");
      $("div[id='id 4 7']").removeClass().addClass("sth");
      $("div[id='id 5 6']").removeClass().addClass("syh");
      $("div[id='id 3 8']").removeClass().addClass("svh");
   };
  if(lvlnum==7){
    create()
      $("div[id='id 6 6']").removeClass().addClass("wall");
      $("div[id='id 6 5']").removeClass().addClass("syb");
      $("div[id='id 7 7']").removeClass().addClass("syh");
      $("div[id='id 7 6']").removeClass().addClass("sbb");
      $("div[id='id 5 7']").removeClass().addClass("sbh");
      $("div[id='id 5 6']").removeClass().addClass("sgb");
      $("div[id='id 7 5']").removeClass().addClass("sgh");
      $("div[id='id 6 7']").removeClass().addClass("srb");
      $("div[id='id 5 5']").removeClass().addClass("srh");
   };
  if(lvlnum==8){
    create()
      $("div[id='id 2 1']").removeClass().addClass("wall");
      $("div[id='id 2 2']").removeClass().addClass("wall");
      $("div[id='id 2 3']").removeClass().addClass("wall");
      $("div[id='id 2 4']").removeClass().addClass("wall");
      $("div[id='id 2 5']").removeClass().addClass("wall");
      $("div[id='id 2 6']").removeClass().addClass("wall");
      $("div[id='id 2 7']").removeClass().addClass("wall");
      $("div[id='id 2 11']").removeClass().addClass("wall");
      $("div[id='id 2 8']").removeClass().addClass("wall");
      $("div[id='id 3 9']").removeClass().addClass("wall");
      $("div[id='id 4 10']").removeClass().addClass("wall");
      $("div[id='id 5 10']").removeClass().addClass("wall");
      $("div[id='id 6 10']").removeClass().addClass("wall");
      $("div[id='id 7 10']").removeClass().addClass("wall");
      $("div[id='id 8 10']").removeClass().addClass("wall");
      $("div[id='id 10 1']").removeClass().addClass("wall");
      $("div[id='id 10 2']").removeClass().addClass("wall");
      $("div[id='id 10 3']").removeClass().addClass("wall");
      $("div[id='id 10 4']").removeClass().addClass("wall");
      $("div[id='id 10 5']").removeClass().addClass("wall");
      $("div[id='id 10 6']").removeClass().addClass("wall");
      $("div[id='id 10 7']").removeClass().addClass("wall");
      $("div[id='id 10 8']").removeClass().addClass("wall");
      $("div[id='id 10 11']").removeClass().addClass("wall");
      $("div[id='id 9 9']").removeClass().addClass("wall");
      $("div[id='id 1 1']").removeClass().addClass("srb");
      $("div[id='id 1 2']").removeClass().addClass("sgb");
      $("div[id='id 1 3']").removeClass().addClass("sbb");
      $("div[id='id 1 4']").removeClass().addClass("syb");
      $("div[id='id 3 1']").removeClass().addClass("sth");
      $("div[id='id 9 1']").removeClass().addClass("svh");
      $("div[id='id 8 9']").removeClass().addClass("stb");
      $("div[id='id 4 9']").removeClass().addClass("svb");
      $("div[id='id 11 1']").removeClass().addClass("srh");
      $("div[id='id 11 2']").removeClass().addClass("sgh");
      $("div[id='id 11 3']").removeClass().addClass("sbh");
      $("div[id='id 11 4']").removeClass().addClass("syh");
      $("div[id='id 4 1']").removeClass().addClass("wall");
      $("div[id='id 8 1']").removeClass().addClass("wall");
   };
  if(lvlnum==9){
    create()
      $("div[id='id 3 3']").removeClass().addClass("wall");
      $("div[id='id 4 4']").removeClass().addClass("wall");
      $("div[id='id 5 5']").removeClass().addClass("wall");
      $("div[id='id 3 5']").removeClass().addClass("wall");
      $("div[id='id 5 3']").removeClass().addClass("wall");
      $("div[id='id 3 7']").removeClass().addClass("wall");
      $("div[id='id 4 8']").removeClass().addClass("wall");
      $("div[id='id 5 9']").removeClass().addClass("wall");
      $("div[id='id 3 9']").removeClass().addClass("wall");
      $("div[id='id 6 6']").removeClass().addClass("wall");
      $("div[id='id 7 7']").removeClass().addClass("wall");
      $("div[id='id 7 3']").removeClass().addClass("wall");
      $("div[id='id 8 4']").removeClass().addClass("wall");
      $("div[id='id 9 3']").removeClass().addClass("wall");
      $("div[id='id 9 5']").removeClass().addClass("wall");
      $("div[id='id 4 3']").removeClass().addClass("srh");
      $("div[id='id 4 5']").removeClass().addClass("srb");
      $("div[id='id 5 4']").removeClass().addClass("sbb");
      $("div[id='id 6 7']").removeClass().addClass("sgb");
      $("div[id='id 7 6']").removeClass().addClass("syb");
      $("div[id='id 3 8']").removeClass().addClass("syh");
      $("div[id='id 8 3']").removeClass().addClass("sgh");
      $("div[id='id 3 4']").removeClass().addClass("sbh");
   };
  if(lvlnum==10){
    create()
      $("div[id='id 4 10']").removeClass().addClass("wall");
      $("div[id='id 8 10']").removeClass().addClass("wall");
      $("div[id='id 6 9']").removeClass().addClass("wall");
      $("div[id='id 5 8']").removeClass().addClass("wall");
      $("div[id='id 4 8']").removeClass().addClass("wall");
      $("div[id='id 3 8']").removeClass().addClass("wall");
      $("div[id='id 3 7']").removeClass().addClass("wall");
      $("div[id='id 3 6']").removeClass().addClass("wall");
      $("div[id='id 7 8']").removeClass().addClass("wall");
      $("div[id='id 8 8']").removeClass().addClass("wall");
      $("div[id='id 9 8']").removeClass().addClass("wall");
      $("div[id='id 9 7']").removeClass().addClass("wall");
      $("div[id='id 9 6']").removeClass().addClass("wall");
      $("div[id='id 5 6']").removeClass().addClass("wall");
      $("div[id='id 5 5']").removeClass().addClass("wall");
      $("div[id='id 6 5']").removeClass().addClass("wall");
      $("div[id='id 7 5']").removeClass().addClass("wall");
      $("div[id='id 7 6']").removeClass().addClass("wall");
      $("div[id='id 6 3']").removeClass().addClass("wall");
      $("div[id='id 5 2']").removeClass().addClass("wall");
      $("div[id='id 7 2']").removeClass().addClass("wall");
      $("div[id='id 6 6']").removeClass().addClass("srb");
      $("div[id='id 6 2']").removeClass().addClass("srh");
      $("div[id='id 4 7']").removeClass().addClass("syb");
      $("div[id='id 8 11']").removeClass().addClass("syh");
      $("div[id='id 4 11']").removeClass().addClass("sbh");
      $("div[id='id 8 7']").removeClass().addClass("sbb");
      $("div[id='id 6 8']").removeClass().addClass("sgb");
      $("div[id='id 6 7']").removeClass().addClass("sgh");
   };
  if(lvlnum==11){
    create()
      $("div[id='id 10 5']").removeClass().addClass("wall");
      $("div[id='id 9 1']").removeClass().addClass("wall");
      $("div[id='id 11 6']").removeClass().addClass("wall");
      $("div[id='id 10 6']").removeClass().addClass("wall");
      $("div[id='id 8 5']").removeClass().addClass("wall");
      $("div[id='id 6 4']").removeClass().addClass("wall");
      $("div[id='id 5 4']").removeClass().addClass("wall");
      $("div[id='id 5 2']").removeClass().addClass("wall");
      $("div[id='id 2 4']").removeClass().addClass("wall");
      $("div[id='id 2 3']").removeClass().addClass("wall");
      $("div[id='id 2 5']").removeClass().addClass("wall");
      $("div[id='id 4 6']").removeClass().addClass("wall");
      $("div[id='id 4 7']").removeClass().addClass("wall");
      $("div[id='id 2 8']").removeClass().addClass("wall");
      $("div[id='id 5 10']").removeClass().addClass("wall");
      $("div[id='id 6 9']").removeClass().addClass("wall");
      $("div[id='id 7 8']").removeClass().addClass("wall");
      $("div[id='id 9 9']").removeClass().addClass("wall");
      $("div[id='id 11 10']").removeClass().addClass("wall");
      $("div[id='id 1 1']").removeClass().addClass("srh");
      $("div[id='id 5 1']").removeClass().addClass("srb");
      $("div[id='id 3 5']").removeClass().addClass("sgh");
      $("div[id='id 7 4']").removeClass().addClass("sgb");
      $("div[id='id 11 4']").removeClass().addClass("sbb");
      $("div[id='id 11 5']").removeClass().addClass("sbh");
      $("div[id='id 8 11']").removeClass().addClass("stb");
      $("div[id='id 2 11']").removeClass().addClass("sth");
      $("div[id='id 7 9']").removeClass().addClass("syh");
      $("div[id='id 8 8']").removeClass().addClass("syb");
  };
  if(lvlnum==12){
    create()
      $("div[id='id 3 8']").removeClass().addClass("wall");
      $("div[id='id 2 7']").removeClass().addClass("wall");
      $("div[id='id 4 7']").removeClass().addClass("wall");
      $("div[id='id 3 5']").removeClass().addClass("wall");
      $("div[id='id 4 4']").removeClass().addClass("wall");
      $("div[id='id 5 5']").removeClass().addClass("wall");
      $("div[id='id 7 5']").removeClass().addClass("wall");
      $("div[id='id 8 4']").removeClass().addClass("wall");
      $("div[id='id 9 5']").removeClass().addClass("wall");
      $("div[id='id 8 7']").removeClass().addClass("wall");
      $("div[id='id 9 8']").removeClass().addClass("wall");
      $("div[id='id 10 7']").removeClass().addClass("wall");
      $("div[id='id 5 6']").removeClass().addClass("sbh");
      $("div[id='id 11 6']").removeClass().addClass("sbb");
      $("div[id='id 1 6']").removeClass().addClass("syb");
      $("div[id='id 7 6']").removeClass().addClass("syh");
      $("div[id='id 8 5']").removeClass().addClass("sgh");
      $("div[id='id 2 8']").removeClass().addClass("sgb");
      $("div[id='id 10 8']").removeClass().addClass("srb");
      $("div[id='id 4 5']").removeClass().addClass("srh");
      $("div[id='id 3 7']").removeClass().addClass("sth");
      $("div[id='id 9 4']").removeClass().addClass("stb");
      $("div[id='id 9 7']").removeClass().addClass("svh");
      $("div[id='id 3 4']").removeClass().addClass("svb");
  };
  if(lvlnum==13){
    create()
      $("div[id='id 1 1']").removeClass().addClass("wall");
      $("div[id='id 2 2']").removeClass().addClass("wall");
      $("div[id='id 2 3']").removeClass().addClass("wall");
      $("div[id='id 3 4']").removeClass().addClass("wall");
      $("div[id='id 3 5']").removeClass().addClass("wall");
      $("div[id='id 4 6']").removeClass().addClass("wall");
      $("div[id='id 4 7']").removeClass().addClass("wall");
      $("div[id='id 5 8']").removeClass().addClass("wall");
      $("div[id='id 5 9']").removeClass().addClass("wall");
      $("div[id='id 7 9']").removeClass().addClass("wall");
      $("div[id='id 7 8']").removeClass().addClass("wall");
      $("div[id='id 6 6']").removeClass().addClass("wall");
      $("div[id='id 5 4']").removeClass().addClass("wall");
      $("div[id='id 6 4']").removeClass().addClass("wall");
      $("div[id='id 7 4']").removeClass().addClass("wall");
      $("div[id='id 6 2']").removeClass().addClass("wall");
      $("div[id='id 8 7']").removeClass().addClass("wall");
      $("div[id='id 8 6']").removeClass().addClass("wall");
      $("div[id='id 9 5']").removeClass().addClass("wall");
      $("div[id='id 9 4']").removeClass().addClass("wall");
      $("div[id='id 10 3']").removeClass().addClass("wall");
      $("div[id='id 10 2']").removeClass().addClass("wall");
      $("div[id='id 11 1']").removeClass().addClass("wall");
      $("div[id='id 6 7']").removeClass().addClass("sbh");
      $("div[id='id 6 8']").removeClass().addClass("sbb");
      $("div[id='id 1 3']").removeClass().addClass("srb");
      $("div[id='id 1 2']").removeClass().addClass("srh");
      $("div[id='id 11 2']").removeClass().addClass("sgh");
      $("div[id='id 8 8']").removeClass().addClass("syh");
      $("div[id='id 8 8']").removeClass().addClass("svh");
      $("div[id='id 6 3']").removeClass().addClass("syh");
      $("div[id='id 4 8']").removeClass().addClass("sth");
      $("div[id='id 7 10']").removeClass().addClass("svb");
      $("div[id='id 3 10']").removeClass().addClass("stb");
      $("div[id='id 9 6']").removeClass().addClass("sgb");
      $("div[id='id 5 3']").removeClass().addClass("syb");
  };
  });
  $("#prevlvl").click(function(){
    if(lvlnum>1){
      lvlnum--;
      $("#levelbutton").removeClass().addClass("levels_"+lvlnum)
      $("#levelbutton p").text("Level "+lvlnum)
    }
    else{
      lvlnum=13;
      $("#levelbutton").removeClass().addClass("levels_"+lvlnum)
      $("#levelbutton p").text("Level "+lvlnum)
    }
  });
  $("#nextlvl").click(function(){
    if(lvlnum<13){
      lvlnum++;
      $("#levelbutton").removeClass().addClass("levels_"+lvlnum)
      $("#levelbutton p").text("Level "+lvlnum)
    }
    else{
      lvlnum=1;
      $("#levelbutton").removeClass().addClass("levels_"+lvlnum)
      $("#levelbutton p").text("Level "+lvlnum)
    }
  });
  $("#newlvlbutton").click(function(){
    while(stringarray.length>1){
      var string1=stringarray.shift()
      var string2=stringarray.shift()
      var string3="$(\"div[id='"+string1+"']\").removeClass().addClass(\""+string2+"\");\n";
      string+=string3;
    }
    this.href="data:text/plain;charset=UTF-8,"+encodeURIComponent(string);
    string="";
  });
});