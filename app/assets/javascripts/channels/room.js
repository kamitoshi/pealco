var room_id = window.location.href.split("/").pop();

App.room = App.cable.subscriptions.create(
  {
    channel: "RoomChannel",
    room_id: `${room_id}`,
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
      messages.innerHTML += message;
      // Called when there's incoming data on the websocket for this channel
    },

    speak: function (content) {
      return this.perform("speak", { message: content });
    },
  }
);

document.addEventListener("DOMContentLoaded", function () {
  // function scrollBottom() {
  //   var elementHtml = document.documentElement;
  //   var bottom = elementHtml.scrollHeight - elementHtml.clientHeight;
  //   window.scroll(0, bottom);
  // }
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
