$(document).on("turbolinks:load", function() {
  if (App.page) {
    App.page.unsubscribe();
    delete App.page;
  }
  if ($("#pet")) {
    App.page = App.cable.subscriptions.create({
    channel: "PageChannel",
    url: $("#pet").data('page-url')
  }, {
    connected: function() {
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      $("#petcount").html(data.pet_count);
      var newPetting = '<div class="col-md-4">';
      if (data.petter) {
        newPetting = newPetting + '<h3 class="adaptive">Petted by <a class="adaptive" href="/' + data.petter.url + '">' + data.petter.name + '</a></h3>';
      } else {
        newPetting = newPetting + '<h3 class="adaptive">Petted anonymously</h3>';
      }
      newPetting = newPetting + '<h3><small class="adaptive">Just now</small></h3>';
      newPetting = newPetting + '</div>';
      $(newPetting).hide().prependTo("#pettings").fadeIn(1000);
      if ($("#pettings .col-md-4").length > 6) {
        $("#pettings .col-md-4").last().remove();
      }
      BackgroundCheck.refresh();
      // Called when there's incoming data on the websocket for this channel
    }
  });
}
});
