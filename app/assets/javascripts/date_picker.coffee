ready = ->
  dateFormat = 'yy-mm-dd';
  $('.date-picker').datepicker(
    dateFormat: dateFormat,
  );
$(document).ready(ready)
$(document).on('turbolinks:load', ready)
