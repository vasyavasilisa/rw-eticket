/**
 * Created by USER on 14.04.2017.
 */
function addPassanger(){
var count=document.getElementById("id_count").value;
   // alert(count);
    var new_passangers="";
    for(var i=2;i<=count;i++){
        new_passangers+= '<h4>Пассажир:'+i+'</h4>Фамилия:<input type="text" name="surname"  value=""><br/><br/>'+
            'Имя:<input type="text" name="name" value=""> <br/><br/>'+
            'Номер паспорта:<input type="text" name="passport" value=""><br/><br/>';
    }

   var div_passN=document.getElementById("passN");
    div_passN.innerHTML=new_passangers;
}

function swaper(){
   
    var depVal= document.getElementById("id_department").value;
    var arrVal=document.getElementById("id_arrive").value;
    document.getElementById("id_department").value=arrVal;
    document.getElementById("id_arrive").value=depVal;
}