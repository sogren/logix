var columns=13;
var rows=13;
var $square=$("<div />",{class:"square"});
var style="wall";
var onoff=0;
var dir="";
var aid="";
var nid="";
var nc="";
var moves=0;
var done=0;
var ifwall=0;
var casualarray=[]
var bigarray=[];
var bigarraytemp=[];
var bigarraytemptwo=[]
var bpositions=[];
var hpositions=[];
var bpt=[];
var deepcontrol=0;
var finalcontrol=0;
var bigarraymove=[];
var bigarraymovetemp=[];
var bigarraymovetemptwo=[];
var movetype="";
var movetypetemp="";
var mcctrl=0;
var camera=true;
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function create(){
      $("#container").empty();
      moves=0;
      $("#counter span").text(moves)
      for(var r=0; r<rows; r++){
        for(var c=0; c<columns; c++){
          var $div = $("<div>", {id: "id "+c+" "+r, class: "square"});
          if(r==0||r==12||c==0||c==12)
            $div = $("<div>", {id: "id "+c+" "+r, class: "wall"});
          $("#container").append($div);
      }}

      $(".square").click(function(){
        if(onoff==0)
        return false;
            if($(this).hasClass(style)){
              $(this).removeClass( );
              $(this).addClass("square");
              if(~stringarray.indexOf($(this).attr("id")))
                stringarray.splice(stringarray.indexOf($(this).attr("id")),2)
            }
            else if($(this).attr("class").charAt(1)==style[1]){
              $(this).removeClass( );
              $(this).addClass(style[0]+style[1]+"i")
            }
            else if($(this).attr("class").charAt(2)=="h"){
              h=$(this).css("backgroundColor")
              e="s"+$(this).attr("class").charAt(1)+style[1]+"w"
              $(this).removeClass( ).addClass(style);
              g=$(this).css("backgroundColor")
              $(this).removeClass().addClass(e).css("background",rgb2hex(g))
              $(this).css("border",h+" solid 2px")
              casualarray.push($(this).attr("class"))
              console.log("hello"+casualarray[0])
            }
            else{
              $(this).removeClass( ).removeAttr("style")
              if(style!="wall"){
                var tempid=$("div.wrapper").find("."+style).attr("id")
                for(var i=0; i<casualarray.length; i++){
                  if(casualarray[i].charAt(2)==style[1]){
                    var k="s"+casualarray[i].charAt(1)+"h"
                    $("div.wrapper").find("."+casualarray[i]).removeClass().removeAttr("style").addClass(k)
                    casualarray.shift()
                }}

                $("div.wrapper").find("."+style).removeClass(style).addClass("square")
                if(~stringarray.indexOf(tempid))
                  stringarray.splice(stringarray.indexOf(tempid),2)
              }
              $(this).addClass(style);
              stringarray.push($(this).attr("id"));
              stringarray.push($(this).attr("class"));
            }
        });
  };
var color = '';
function ic(x){
  return b="div[id='"+x+"']";
}
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function hex2rgb(hexStr){
    var hex = parseInt(hexStr.substring(1), 16);
    var r = (hex & 0xff0000) >> 16;
    var g = (hex & 0x00ff00) >> 8;
    var b = hex & 0x0000ff;
    return "rgb("+r+","+g+","+ b+")";
}
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function rgb2hex(colorval){
    var parts = colorval.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
    delete(parts[0]);
    for (var i = 1; i <= 3; ++i) {
        parts[i] = parseInt(parts[i]).toString(16);
        if (parts[i].length == 1) parts[i] = '0' + parts[i];
    }
    return color = '#' + parts.join('');
}
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function sub(a,b,d){
    var c;
    c=$(ic(a)).attr("class")
    c=c.replace((c.substr(c.length-1)),d)
      $(ic(b)).removeClass().addClass(c)
  };
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function subw(n,a){
    var c,d,e,f;
    f=$(ic(n)).attr("class")
    c=$(ic(a)).attr("class")
    if(c.substr(2,1)==f.substr(1,1)){
      d="s"+c.substr(2,1)+"i";
      e="s"+c.substr(1,1)+"h";
      $(ic(n)).removeClass().addClass(d);
      $(ic(a)).removeClass().addClass(e).addClass(e).removeAttr( 'style' );
    }
    else if(c.substr(c.length-1)=="i"){
      d="s"+c.substr(1,1)+"h"
      e="s"+f.substr(1,1)+c.substr(1,1)+"w"
      g=$(ic(a)).css("backgroundColor")
      h=$(ic(n)).css("backgroundColor")
      $(ic(a)).removeClass().addClass(d).removeAttr( 'style' );
      $(ic(n)).removeClass().addClass(e).css("background",rgb2hex(g))
      $(ic(n)).css("border",h+" solid 2px")
    }
    else if(f.substr(f.length-1)=="h"){
      d="s"+c.substr(1,1)+"h"
      e="s"+f.substr(1,1)+c.substr(2,1)+"w"
      g=$(ic(a)).css("backgroundColor")
      h=$(ic(n)).css("backgroundColor")
      $(ic(a)).removeClass().addClass(d).removeAttr( 'style' );
      $(ic(n)).removeClass().addClass(e).css("background",rgb2hex(g))
      $(ic(n)).css("border",h+" solid 2px")
    }
    else{
      d="s"+c.substr(1,1)+"h"
      e="s"+c.substr(2,1)+"b"
      $(ic(a)).removeClass().addClass(d).removeAttr( 'style' );
      $(ic(n)).removeClass().addClass(e).removeAttr( 'style' );
    }
  };
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function cc(n,a){
  var c,d,e;
  c="s"+($(ic(n)).attr("class").substr(1,1))+($(ic(a)).attr("class").substr(1,1))+"w";
  d=$(ic(a)).css("backgroundColor");
  e=$(ic(n)).css("backgroundColor");
  $(ic(n)).removeClass().addClass(c)
  $(ic(a)).removeClass().addClass("square")
  $(ic(n)).css("background",rgb2hex(d))
  $(ic(n)).css("border",e+" solid 2px")
}
var blop=0;
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function operations(aid,nid){
              if($(ic(aid)).attr("class").substr($(ic(aid)).attr("class").length - 1)=="b"){
                  if($(ic(nid)).attr("class").substr($(ic(nid)).attr("class").length - 1)=="h"){
                    if($(ic(nid)).attr("class").substr(1,1)==$(ic(aid)).attr("class").substr(1,1)){
                      sub(nid,nid,"i")
                      $(ic(aid)).removeClass().addClass("square")
                    }
                    else{
                      cc(nid,aid)
                    }
                  }
                  if($(ic(nid)).hasClass("square")){
                    $(ic(nid)).removeClass().addClass($(ic(aid)).attr("class"))
                    $(ic(aid)).removeClass().addClass("square")
                  }
               }
               else if($(ic(aid)).attr("class").charAt($(ic(aid)).attr("class").length - 1)=="i"){
                  if($(ic(nid)).attr("class").substr($(ic(nid)).attr("class").length - 1)=="h"){
                    subw(nid,aid)
                  }
                  else if($(ic(nid)).hasClass("square")){
                    sub(aid,nid,"b")
                    sub(aid,aid,"h")
                  }
               }
               else if($(ic(aid)).attr("class").substr($(ic(aid)).attr("class").length - 1)=="w"){
                  if($(ic(nid)).attr("class").substr($(ic(nid)).attr("class").length - 1)=="h"){
                    subw(nid,aid)
                  }
                  else if($(ic(nid)).hasClass("square")){
                    subw(nid,aid)
                  }
               }
               else{
                  ifwall=1;
               }
  }
var deg=0
var rotationxd=1
var degtemp=0;
var rotad=0
var hji=0;
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function move(){
  if(!camera&&onoff==0)
    switch(rotationxd){
      case 1:
          if(dir=="up"){
            dir="up"
            hji=0
            rotad=0
          }
          else if(dir=="down"){
            dir="down"
            hji=180
            rotad=2
          }
          else if(dir=="right"){
            dir="right"
            hji=-90
            rotad=-1
          }
          else if(dir=="left"){
            dir="left"
            hji=90
            rotad=1
          }
        break;
      case 2:
          if(dir=="up"){
            dir="left"
            hji=0
            rotad=0
          }
          else if(dir=="down"){
            dir="right"
            hji=180
            rotad=2
          }
          else if(dir=="right"){
            dir="up"
            hji=-90
            rotad=-1
          }
          else if(dir=="left"){
            dir="down"
            hji=90
            rotad=1
          }
        break;
      case 3:
          if(dir=="up"){
            dir="down"
            hji=0
            rotad=0
          }
          else if(dir=="down"){
            dir="up"
            hji=180
            rotad=2
          }
          else if(dir=="right"){
            dir="left"
            hji=-90
            rotad=-1
          }
          else if(dir=="left"){
            dir="right"
            hji=90
            rotad=1
          }
        break;
      case 4:
          if(dir=="up"){
            dir="right"
            hji=0
            rotad=0
          }
          else if(dir=="down"){
            dir="left"
            hji=180
            rotad=2
          }
          else if(dir=="right"){
            dir="down"
            hji=-90
            rotad=-1
          }
          else if(dir=="left"){
            dir="up"
            hji=90
            rotad=1
          }
        break;
    }
    if(rotationxd+rotad>4)
      rotationxd-=4
    if(rotationxd+rotad<1)
      rotationxd+=4
    if(onoff===0)
    switch(dir){
      case "up":
          for(var r=0; r<13; r++)
            for(var c=0; c<13; c++){
              aid="id "+c+" "+r;
              var k=r-1;
              nid="id "+c+" "+k;
              operations(aid,nid)
            }
          deg+=hji
          hehe()
          rotationxd+=rotad
        break;
      case "down":
          for(var r=12; r>=0; r--)
            for(var c=12; c>=0; c--){
              aid="id "+c+" "+r;
              var k=r+1;
              nid="id "+c+" "+k;
              var abc="abcde";
              operations(aid,nid)
          }
          deg+=hji
          hehe()
          rotationxd+=rotad
        break;
      case "right":
          for(var r=12; r>=0; r--)
            for(var c=12; c>=0; c--){
              aid="id "+c+" "+r;
              var k=c+1;
              nid="id "+k+" "+r;
              operations(aid,nid)
            }
          deg+=hji
          hehe()
          rotationxd+=rotad
        break;
      case "left":
          for(var r=0; r<13; r++)
            for(var c=0; c<13; c++){
              aid="id "+c+" "+r;
              var k=c-1;
              nid="id "+k+" "+r;
              operations(aid,nid)
            }
          deg+=hji
          hehe()
          rotationxd+=rotad
        break;
    }
  };
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function check(){
  var a=0,b=0,k;
      for(var r=0; r<13; r++)
        for(var c=0; c<13; c++){
          aid="id "+c+" "+r;
          k=$(ic(aid)).attr("class");
          if((k.substr(k.length - 1)=="h") || (k.substr(k.length - 1)=="b") || (k.substr(k.length - 1)=="w"))
            a++;
          if(!(k.substr(k.length - 1)=="e") && !(k.substr(k.length - 1)=="l"))
            b++;
        }
      if(a==0&&b!=0){
        done=1;
        alert("yiss")
      }
}
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function pushposition(){
  var k;
      for(var r=0; r<13; r++)
        for(var c=0; c<13; c++){
          aid="id "+c+" "+r;
          k=$(ic(aid)).attr("class");
          d=k.length;
          if(k.substr(d - 1)!="h" && d<5){
            if(k.charAt(k.length -2)=="r")
              bpositions.push(aid);
            if(k.charAt(k.length -2)=="g")
              bpositions.push(aid);
            if(k.charAt(k.length -2)=="b")
              bpositions.push(aid);
            if(k.charAt(k.length -2)=="y")
              bpositions.push(aid);
            if(k.charAt(k.length -2)=="t")
              bpositions.push(aid);
            if(k.charAt(k.length -2)=="v")
              bpositions.push(aid);
          }
          if(k.substr(d - 1)=="h"){
            if(k.charAt(k.length -2)=="r")
              hpositions[0]=aid;
            if(k.charAt(k.length -2)=="g")
              hpositions[1]=aid;
            if(k.charAt(k.length -2)=="b")
              hpositions[2]=aid;
            if(k.charAt(k.length -2)=="y")
              hpositions[3]=aid;
            if(k.charAt(k.length -2)=="t")
              hpositions[4]=aid;
            if(k.charAt(k.length -2)=="v")
              hpositions[5]=aid;
          }
        }
        console.log(bpositions);
        console.log(hpositions);
        bigarraymove.push("s");
        bigarraytemp.push(bpositions);
        bigarraymovetemp.push("s");
        bigarray.push(bpositions);
}
var g=0;
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function blockcheck(ca,x,y,i){
  var a=ca.substr(2,ca.lastIndexOf(" ")-2)
  var b=ca.substr(ca.lastIndexOf(" "),ca.length)
  var c="id "+(parseInt(a)+x)+" "+(parseInt(b)+y);
  var d=$(ic(c)).attr("class")
    if(d.charAt(d.length-1)=="e"||d.charAt(d.length-1)=="h"){
      mcctrl++;
      return false;
    }
    else if(d.charAt(d.length-1)=="l"){
      return false;
    }
    else{
      blockcheck(c,x,y,i)
    }

}
Array.prototype.compare = function(array){
  for(var i=0; i<this.length; i++)
    if(this[i]!=array[i])
      return false;
  return true;
}
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function mcop(x,y){
  var ctr=0;
  bpt=new Array();
  for(var i=0; i<bpositions.length; i++){
      var a=bpositions[i].substr(2,bpositions[i].lastIndexOf(" ")-2)
      var b=bpositions[i].substr(bpositions[i].lastIndexOf(" "),bpositions[i].length)
      var c="id "+(parseInt(a)+x)+" "+(parseInt(b)+y);
      var d=$(ic(c)).attr("class")
      if(d.charAt(d.length-1)=="e"||d.charAt(d.length-1)=="h"){
        bpt.push(c);
        ctr++;
      }
      else if(d.charAt(d.length-1)=="l")
        bpt.push(bpositions[i])
      else{
        mcctrl=0;
        blockcheck(c,x,y,i)
        if(mcctrl>0){
          bpt.push(c);
          ctr++;
        }
        else
          bpt.push(bpositions[i])
      }
    }
  if(ctr!=0){
    for(var q=0; q<bigarraytempthree.length; q++)
      if(bigarraytempthree[q].compare(bpt))
        yetanotherctrl++;
    for(var q=0; q<bigarraytemp.length; q++)
      if(bigarraytemp[q].compare(bpt))
        yetanotherctrl++;
    if(yetanotherctrl==0){
      bigarraytemp.push(bpt)
      bigarraymovetemp.push(movetype)
    }
    else
      yetanotherctrl=0;
  }
}
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function pathfinder(s,f){
  var a=s.substr(2,s.lastIndexOf(" ")-2)
  var b=s.substr(s.lastIndexOf(" "),s.length)
  var c="id "+(parseInt(a))+" "+(parseInt(b));
  var d=$(ic(c)).attr("class")
}
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
// mam w pushowaniu do move arraya pushowac nowy array majacy w sobie litere ozn ruch i array ktory bedzie zawieral ruchy tego pierwszego xdxdxdxd
var yetanotherctrl=0;
var anotherctrl=0;
var bigarraytempthree=[]
var bigarraymovetempthree=[]
var afcxd=0;
//var arraycheck=["id 2 6","id 10 6"]
function algorithm(){
  var start5=new Date().getTime();
  while(deepcontrol!=23){
    deepcontrol++;
    var start= new Date().getTime();
    bigarraytemptwo=bigarraytemp;
    bigarraytempthree=bigarraytemp
    bigarraymovetemptwo=bigarraymovetemp;
    bigarraymovetempthree=bigarraymovetemp;
    bigarraymove.push(deepcontrol)
    bigarray.push(deepcontrol)
    console.log("start algorithm"+"  "+deepcontrol+"  length  "+bigarray.length)
    bigarraytemp=[];
    bigarraymovetemp=[];
    var start2=new Date().getTime();
    for(var z=0; z<bigarraytemptwo.length; z++){
      bpositions=bigarraytemptwo[z];
      movetypetemp=bigarraymovetemptwo[z]
      movecheck();
    }
    var end2=new Date().getTime();
    var start3=new Date().getTime();
    bigarraytemptwo=[]
    bigarraytemptwo=new Array();
    bigarraymovetemptwo=new Array();
    for(var i=0; i<bigarraytemp.length; i++){
      bigarraytemptwo[i]=bigarraytemp[i];
      bigarraymovetemptwo[i]=bigarraymovetemp[i];
    }
    while(bigarraytemptwo.length>0){
      for(var q=0; q<bigarray.length; q++){
        if(Array.isArray(bigarray[q]))
          if(bigarraytemptwo[0].compare(bigarray[q]))
            finalcontrol++;
      }
      if(finalcontrol==0){
        bigarray.push(bigarraytemptwo.shift())
        bigarraymove.push(bigarraymovetemptwo.shift())
      }
      else{
        bigarraytemptwo.shift()
        bigarraymovetemptwo.shift()
      }
      finalcontrol=0;
    }
    var start4=new Date().getTime();
    for(var i=0; i<bigarray.length; i++){
      if(Array.isArray(bigarray[i]))
        if(bigarray[i].compare(hpositions))
          afcxd++;
    }
    var end4=new Date().getTime();
    var end3=new Date().getTime();
    var end= new Date().getTime();
    if(afcxd>0)
      break;
  //  if(deepcontrol>14)
  //    break;
    console.log("end algorithm"+"  "+deepcontrol+"  length  "+bigarray.length+"    "+afcxd)
    console.log("czas funkcji ---- "+(end-start))
    console.log("czas funkcji ---- "+(end2-start2))
    console.log("czas funkcji ---- "+(end3-start3))
    console.log("czas funkcji ---- "+(end4-start4))
  }
  console.log(bigarray)
  console.log(bigarraymove)
  console.log("end algorithm"+"  "+deepcontrol+"  length  "+bigarray.length+"    "+afcxd)
  var end5=new Date().getTime();
  console.log("czas funkcji ---- "+(end5-start5))
}
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function movecheck(){
    x=0;y=-1;movetype="u";
    mcop(x,y)
    x=1;y=0;movetype="r";
    mcop(x,y)
    x=0;y=1;movetype="d";
    mcop(x,y)
    x=-1;y=0;movetype="l";
    mcop(x,y)
}
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
function hehe(){
//  div = document.getElementById('#container')
//  div.style.webkitTransform = 'rotate('+deg+'deg)';
  if(!camera&&onoff==0)
    $("#container").css("webkitTransform",'rotate('+deg+'deg)')
    $("#container").css("Transform",'rotate('+deg+'deg)')
//  $("#container").style.msTransform     = 'rotate('+deg+'deg)';
//  $("#container").style.oTransform      = 'rotate('+deg+'deg)';
//  $("#container").style.transform       = 'rotate('+deg+'deg)';
}
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
document.onkeydown=checkkey = function(e){
      switch(e.keyCode){
        case 37:
          //left
          dir="left"
          moves++
          move()
        break;
        case 38:
          //up
          dir="up"
          moves++
          move()
        break;
        case 39:
          //right
          dir="right"
          moves++
          move()
        break;
        case 40:
          //down
          dir="down"
          moves++
          move()
        break;
      }
  }
// v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v v
$(document).ready(function(){
  create()
  $("#functions").children().click(function(){
    style=$(this).attr("id")
  });
  $(".dirbutton").click(function(){
    if(onoff==0){
      moves++;
      $("#counter span").text(moves)
      dir=$(this).attr("id")
      move()

    }
  });
  $("#check").click(function(){
    if(onoff==0){
      check()
    }
    pushposition()
    algorithm()
  });
  $("#goback").click(function(){
    if(onoff==0){
      hehe()
    }
  });
  $("#cstatic").click(function(){
    camera=true
    $("#cstatic").css("border","1px solid red")
    $("#cinteractive").css("border","1px solid grey")
  });
  $("#cinteractive").click(function(){
    camera=false
    $("#cstatic").css("border","1px solid grey")
    $("#cinteractive").css("border","1px solid red")
  });
  $("#sendbutton").click(function(){
    if(onoff==0){
      $("body").on("click","#resetbutton", create).find("#resetbutton").text("gonna reset if click beetch");
      onoff=1
      $("body").find("#sendbutton").text("click me to play niggah")
      $("#functions").fadeIn("slow");
      $("#levels").fadeIn("slow");
      $("#cameratype").fadeIn("slow");
      $("#arrows").fadeOut("slow");
    }
    else{
      $("body").off("click","#resetbutton",create).find("#resetbutton").text("ready to playy so i do nuthin");
      onoff=0
      $("body").find("#sendbutton").text("click me to editeh")
      $("#functions").fadeOut("slow");
      $("#levels").fadeOut("slow");
      $("#cameratype").fadeOut("slow");
      $("#arrows").fadeIn("slow");
    }
  });
});