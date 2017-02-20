if ($("#stats")) {
  App.stats = App.cable.subscriptions.create("StatsChannel", {
    connected: function() {
      // Called when the subscription is ready for use on the server
    },

    disconnected: function() {
      // Called when the subscription has been terminated by the server
    },

    received: function(data) {
      if ($("#stats")) {
        $("#stats #total_pets").html(data.total_pets);
        $("#stats #total_pettings").html(data.total_pettings);
      } else {
        App.stats.unsubscribe();
        delete App.stats;
      }
      // Called when there's incoming data on the websocket for this channel
    }
  });
}
