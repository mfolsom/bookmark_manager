

// $(".link").data("favorited", true); //set
// $(".link").data("favorited") //read



function showLinkFavoritedNotice(link) {
  var favorited = !!$(link).data("favorited");
  var name = $(link).find('.title').text();
  var message = favorited ?
              name + " was added to favorites!":
              name + " was removed from favorites!";
  var $flash = $("<div></div>").addClass('flash notice').html(message);
  $flash.appendTo('#flash-container');
  window.setTimeout(function() {
   $($flash).fadeOut();
  },1500);
}


function addFavoritesHandler() {
  $(".star.solid").click(function(event){
    var link = $(this).parent();
    var favorited = !!$(link).data("favorited");
    var newOpacity = favorited ? 0 : 1;
    $(link).data("favorited", !favorited);
    $(this).animate({opacity: newOpacity}, 1000);
    showLinkFavoritedNotice(link);
  });
}

function prepareNewLinkHandler() {
  $('.add-link, .new-user, .new-session').click(function(event) {
    $.get($(this).attr("href"), function(data) {
      if ($('#container #ajax-form').length == 0) {
        $("#container").prepend("<div id='ajax-form'></div>");
      }
      $('#container #ajax-form').html(data);
    });
    event.preventDefault();
  });
}

$(function() {
  addFavoritesHandler();
  prepareNewLinkHandler();
})








