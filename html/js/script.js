window.addEventListener('message', function(event) {
    var item = event.data;

    if (item.type === "ui") {
        document.getElementById('rentacarmenu').style.display = 'block'

    } else if(item.type = 'close') {
        document.getElementById('rentacarmenu').style.display = 'none'

    }
})


$("#kapatma").click(function() {
    $('#rentacarmenu').hide();
    $.post('http://codem-rentacar/escape');
});





$("#buton1").click(function() {
    $('#rentacarmenu').hide();
    $.post('http://codem-rentacar/button1');
});

$("#buton2").click(function() {
    $('#rentacarmenu').hide();
    $.post('http://codem-rentacar/button2');
});
$("#buton3").click(function() {
    $('#rentacarmenu').hide();
    $.post('http://codem-rentacar/button3');
});
$("#buton4").click(function() {
    $('#rentacarmenu').hide();
    $.post('http://codem-rentacar/button4');
});


