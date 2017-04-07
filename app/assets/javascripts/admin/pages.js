$(document).ready(function() {
    $('#photos')
      .on("cocoon:before-remove", function() {
        /* e.g. recalculate order of child items */
        console.log('boe');
      });
// $(document).on('turbolinks:load', function() {
//   $('.remove_fiels.existing.test').bind('click', handleClick);
// })
//
// function handleClick(e) {
//   debugger;
//   var value = $(this).parent().parent().find(':hidden').val();
//   console.log(value);
// }
