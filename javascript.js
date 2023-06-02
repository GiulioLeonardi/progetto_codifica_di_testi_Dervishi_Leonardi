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

