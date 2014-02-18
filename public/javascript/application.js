//favorites

function addFavoritesHandler() {
  $('.star.solid').click(function() {
    var newOpacity = 1 - parseInt($(this).css('opacity')); //by subtracting the current opacity from 1 we get the other opacity
    $(this).animate({opacity:newOpacity},1000);
  });
}

$(function()  {
 addFavoritesHandler();
})