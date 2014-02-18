//favorites

function addFavoritesHandler() {
  $('.star.solid').click(function() {
    $(this).animate({opacity:1},1000);
  });
}

$(function()  {
 addFavoritesHandler();
})