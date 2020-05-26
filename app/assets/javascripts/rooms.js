// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

window.onload = function scrollBottom() {
  var elementHtml = document.documentElement;
  var bottom = elementHtml.scrollHeight - elementHtml.clientHeight;
  window.scroll(0, bottom);
};
