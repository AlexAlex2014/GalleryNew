$(document).on('change', '.custTag', function(){
  var data = $(this).val();
  document.location.href = "http://"+location.host+"/categories/"+data;
});
