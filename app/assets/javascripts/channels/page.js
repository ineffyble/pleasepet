$(document).on("turbolinks:load", function() {
  if (App.page) {
    App.page.unsubscribe();
    delete App.page;
  }
  if (document.getElementById("pet")) {
    var numberOfPettings = 0;
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
      var newPetting = document.createElement("div");
      newPetting.className = "col-md-4";
      var petterHeader = document.createElement("h3");
      petterHeader.className = "adaptive";
      if (data.petter) {
        petterHeader.textContent = "Petted by ";
        var petterLink = document.createElement("a");
        petterLink.className = "adaptive";
        petterLink.href = "/" + data.petter.url;
        petterLink.textContent = data.petter.name;
        petterHeader.appendChild(petterLink);
      } else {
        petterHeader.textContent = "Petted anonymously";
      }
      var petterFooter = document.createElement("h3");
      var petterFooterInner = document.createElement("small");
      petterFooterInner.className = "adaptive";
      petterFooterInner.textContent = "Just now";
      petterFooter.appendChild(petterFooterInner);
      newPetting.appendChild(petterHeader);
      newPetting.appendChild(petterFooter);
      $(newPetting).hide().prependTo("#pettings").fadeIn(1000);
      if ($("#pettings .col-md-4").length > 6) {
        $("#pettings .col-md-4").last().remove();
      }
      BackgroundCheck.refresh();
      // Called when there's incoming data on the websocket for this channel
    },

    petting: function() {
      this.perform('petting', {url: $("#pet").data('page-url')});
      numberOfPettings = numberOfPettings + 1;
      console.log(numberOfPettings);
      if (numberOfPettings > 1000) {
        App.cable.disconnect();
        window.location.replace("/naptime");
      }
    }
  });
}
});
