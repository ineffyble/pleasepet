// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
function getPets() {

  var page_url = $("#pet").data('page-url');
  var latest_petting = $(".petting").first().attr('data-petting-id');

  $.ajax({
    url: '/' + page_url + '/pets',
    dataType: 'json',
    contentType: 'application/json',
    success: function(pettings) {
      if (pettings[0].id > latest_petting) {
        pettings.reverse();
        jQuery.each(pettings, function(i, data) {
          if (data.id > latest_petting) {
            var newPetting = document.createElement("div");
            newPetting.className = "col-md-4 petting";
            var petterHeader = document.createElement("h3");
            petterHeader.className = "adaptive";
            console.log(data);
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
            $(newPetting).attr('data-petting-id', data.id);
            $(newPetting).hide().prependTo("#pettings").fadeIn(1000);
            $(".petting").last().remove();
          }
        });
      }
      setTimeout(getPets, 10000);
    }
  });

}

function pet() {
  var page_url = $("#pet").data('page-url');

  $.ajax({
    url: '/' + page_url + '/pet',
    method: 'POST',
    dataType: 'json',
    contentType: 'application/json',
    success: function(data) {
      var newPetting = document.createElement("div");
      newPetting.className = "col-md-4 petting";
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
      $(newPetting).attr('data-petting-id', data.id);
      $(newPetting).hide().prependTo("#pettings").fadeIn(1000);
      $(".petting").last().remove();
    }
  });
  makeNoise();
}

$(document).on("turbolinks:load", function() {
  if (document.getElementById("pet")) {
    getPets();
  }
});
