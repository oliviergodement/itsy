$(function() {
  $('body').on('click', '.delete-picture', function(){
    $(this).parents("fieldset").fadeOut(500);
  })

  $('body').on('change', '.upload', function(){
    $(this).parents('form').submit();
  });

});