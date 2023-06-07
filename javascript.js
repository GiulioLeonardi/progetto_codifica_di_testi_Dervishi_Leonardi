var flag_mostra_altro = 0

function mostra_altro(){
    if(flag_mostra_altro == 0){
        $('.divinternointro').show();
        $('#btn_mostra_info').text('Mostra meno');
        flag_mostra_altro = 1;
    } else{
        $('.divinternointro').hide();
        $('#btn_mostra_info').text('Mostra altro');
        flag_mostra_altro = 0;
    }
}


function jump_to(id_el){
    $([document.documentElement, document.body]).animate({
        scrollTop: $(id_el).offset().top
    }, 200);
}



flag_mostra_legenda = 0

function mostra_legenda(){
    if(flag_mostra_legenda == 0){
        $('#testo_legenda').show();
        $('#btn_mostra_legenda').text('Nascondi legenda');
        flag_mostra_legenda = 1;
    } else{
        $('#testo_legenda').hide();
        $('#btn_mostra_legenda').text('Mostra legenda');
        flag_mostra_legenda = 0;
    }
}