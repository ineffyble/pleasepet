// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var queued_petting_count = 0;
var send_pettings_timer;

function getPets() {

  var page_url = $("#pet").data('page-url');
  // var latest_petting = $(".petting").first().attr('data-petting-id');

  $.ajax({
    url: '/' + page_url + '/pettings',
    dataType: 'json',
    contentType: 'application/json',
    success: function(pettings) {
      var pettings_count = parseInt($("#petcount").text());
      if (pettings.count > pettings_count) {
        $("#petcount").text(pettings.count);
      }
      // if (pettings[0].id > latest_petting) {
      //   pettings.reverse();
      //   jQuery.each(pettings, function(i, data) {
      //     if (data.id > latest_petting) {
      //       var newPetting = document.createElement("div");
      //       newPetting.className = "col-md-4 petting";
      //       var petterHeader = document.createElement("h3");
      //       petterHeader.className = "adaptive";
      //       console.log(data);
      //       if (data.petter) {
      //         petterHeader.textContent = "Petted by ";
      //         var petterLink = document.createElement("a");
      //         petterLink.className = "adaptive";
      //         petterLink.href = "/" + data.petter.url;
      //         petterLink.textContent = data.petter.name;
      //         petterHeader.appendChild(petterLink);
      //       } else {
      //         petterHeader.textContent = "Petted anonymously";
      //       }
      //       var petterFooter = document.createElement("h3");
      //       var petterFooterInner = document.createElement("small");
      //       petterFooterInner.className = "adaptive";
      //       petterFooterInner.textContent = "Just now";
      //       petterFooter.appendChild(petterFooterInner);
      //       newPetting.appendChild(petterHeader);
      //       newPetting.appendChild(petterFooter);
      //       $(newPetting).attr('data-petting-id', data.id);
      //       $(newPetting).hide().prependTo("#pettings").fadeIn(1000);
      //       $(".petting").last().remove();
      //       var petCount = parseInt($("#petcount").text());
      //       petCount = petCount + 1;
      //       $("#petcount").text(petCount);
      //     }
      //   });
      // }
      setTimeout(getPets, 10000);
    }
  });

}

function pet() {

  var pettings_count = parseInt($("#petcount").text());
  pettings_count = pettings_count + 1;
  $("#petcount").text(pettings_count);

  queued_petting_count = queued_petting_count + 1;

  if (!(send_pettings_timer)) {
    setTimeout(sendPets, 1000);
    send_pettings_timer = true;
  }

  makeNoise();
  $("input[type=submit]").attr("disabled", "disabled");
  setTimeout(function() {
    $("input[type=submit]").removeAttr("disabled");
  }, 100);
}

function sendPets() {
  console.log("Sending " + queued_petting_count + " queued pets.");
  var page_url = $("#pet").data('page-url');

  $.ajax({
    url: '/' + page_url + '/petting',
    method: 'POST',
    dataType: 'json',
    contentType: 'application/json',
    data: JSON.stringify({ this_many: queued_petting_count }),
    success: function(data) {
      // var newPetting = document.createElement("div");
      // newPetting.className = "col-md-4 petting";
      // var petterHeader = document.createElement("h3");
      // petterHeader.className = "adaptive";
      // if (data.petter) {
      //   petterHeader.textContent = "Petted by ";
      //   var petterLink = document.createElement("a");
      //   petterLink.className = "adaptive";
      //   petterLink.href = "/" + data.petter.url;
      //   petterLink.textContent = data.petter.name;
      //   petterHeader.appendChild(petterLink);
      // } else {
      //   petterHeader.textContent = "Petted anonymously";
      // }
      // var petterFooter = document.createElement("h3");
      // var petterFooterInner = document.createElement("small");
      // petterFooterInner.className = "adaptive";
      // petterFooterInner.textContent = "Just now";
      // petterFooter.appendChild(petterFooterInner);
      // newPetting.appendChild(petterHeader);
      // newPetting.appendChild(petterFooter);
      // $(newPetting).attr('data-petting-id', data.id);
      // $(newPetting).hide().prependTo("#pettings").fadeIn(1000);
      // $(".petting").last().remove();
      // var petCount = parseInt($("#petcount").text());
      // petCount = petCount + 1;
      // $("#petcount").text(petCount);
    },
      statusCode: {
        429: function() {
            $("#fourtwonine").dialog({
                modal: true,
                width: 500,
                buttons: {
                    "Mew :(": function() {
                        $(this).dialog("close");
                    }
                }
            });
        }
      }
  });
  queued_petting_count = 0;
  send_pettings_timer = false;
}

$(document).on("turbolinks:load", function() {
  if (document.getElementById("pet")) {
    getPets();
  }
});
