$(document).ready(function(){
  ;(function($){
    $('.cpf').mask('000.000.000-00');
    $('.license_plate').mask('SSS-0000');
    $('.date').mask('00/00/0000');
    $('.year').mask('0000');
    $('.uf').mask('SS');
    $('.zip').mask('00000-000');
    $('.phone').mask('(00) 90000-0000');
    $('.money').mask('000.000,00', {reverse: true});
  })(jQuery);
})
