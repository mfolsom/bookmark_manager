

$(".link").data("favorited", true); //set
$(".link").data("favorited") //read

$(".star.solid").click(function(event){
  var link = $(this).parent();
  var favorited = !!$(link).data("favorited");
  var newOpacity = favorited ? 0 : 1;
  $(link).data("favorited", !favorited);
  $(this).animate({opacity: newOpacity}, 1000);
});

