import consumer from "./consumer"

$(document).on('turbolinks:load', function () {
  let ad = document.getElementById('ad-id');

  if (ad !== null) {

    consumer.subscriptions.create({channel: "CommentsChannel", ad_id: ad.dataset.id}, {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        $('#comments').append(data.comment)
      }
    });
  }
});


