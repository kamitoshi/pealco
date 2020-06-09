var room_id = window.location.href.split("/").pop();

App.room = App.cable.subscriptions.create(
  {
    channel: "RoomChannel",
    room_id: room_id,
  },
  {
    connected: function () {
      // Called when the subscription is ready for use on the server
    },

    disconnected: function () {
      // Called when the subscription has been terminated by the server
    },

    received: function (message) {
      var messages = document.getElementById("messages");
      var current_user_id = $("#messages").attr("data-current_user_id");

      messages.innerHTML += message.data;
      if (message.user_id != current_user_id) {
        $("#currentMessage" + message.id).removeClass("myMessage");
        $("#currentMessage" + message.id).addClass("otherMessage");
        $("#current-message-" + message.id).removeClass("my-message");
        $("#current-message-" + message.id).addClass("other-message");
      }
      console.log("#currentMessage" + message.id);
      // Called when there's incoming data on the websocket for this channel
      function scrollBottom() {
        var elementHtml = document.documentElement;
        var bottom = elementHtml.scrollHeight - elementHtml.clientHeight;
        window.scroll(0, bottom);
      }
      scrollBottom(), 3000;
    },

    speak: function (content) {
      return this.perform("speak", { message: content });
    },
  }
);

document.addEventListener("DOMContentLoaded", function () {
  var input = document.getElementById("chat_input");
  var chat_btn = document.getElementById("chat_btn");
  chat_btn.addEventListener("click", function () {
    var content = input.value;
    App.room.speak(content);
    input.value = "";
  });
  $("#chat_input").keypress(function (e) {
    if (e.which == 13) {
      var content = input.value;
      App.room.speak(content);
      input.value = "";
    }
  });
});
