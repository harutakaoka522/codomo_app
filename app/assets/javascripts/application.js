// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require popper
//= require bootstrap-sprockets
//= require turbolinks
//= require moment
//= require fullcalendar
//= require fullcalendar/lang/ja
// = require data-confirm-modal
//= require_tree .




$(function () {
    // 画面遷移を検知
    $(document).on('turbolinks:load', function () {
        // lengthを呼び出すことで、#calendarが存在していた場合はtrueの処理がされ、無い場合はnillを返す
        if ($('#calendar').length) {
            function eventCalendar() {
                return $('#calendar').fullCalendar({
                });
            };
            function clearCalendar() {
                $('#calendar').html('');
            };

            $(document).on('turbolinks:load', function () {
                eventCalendar();
            });
            $(document).on('turbolinks:before-cache', clearCalendar);

            $('#calendar').fullCalendar({
                events: '/events.json',
                color: '#ff9f89',
                textColor: 'black', // an option!
                header: {
                    // title, prev, next, prevYear, nextYear, today
                    left: 'prev,next today',
                    center: 'title',
                    right:'month agendaWeek agendaDay',
                },
                 

                  eventClick: function(item, jsEvent, view) {
                     alert("タイトル："+item.title+"\n本文："+item.content);
                   },

                   dayClick: function(date, jsEvent, view) {
                     alert("日付け："+date.format());
                   },


                   eventSources: [
                    {
                         url: "your_feed_url1",
                         className: "event1",
                         backgroundColor: "#F3F5F7",
                         textColor: "#3E4051"
                    },
                    {
                         url: "your_feed_url2",
                         className: "event2",
                         backgroundColor: "#98A4AE",
                         textColor: "#3E4051"
                    }
               ],
               timeFormat: ' ',
               timezone: 'Asia/Tokyo',
               eventLimit: true, // イベント増えた時にリンクボタン表示
               editable: true, // 編集可能設定
               selectable: true,
               selectHelper: true,
               droppable: true, 

                   
               eventDrop: function(event, delta, revertFunc) {
                var eventID = event.id;
                var titleID = event.titleId;
                var contentID = event.contentId;
                var statusID = event.statusId;
                var user_idID = event.user_idId;
                var startDateTime = event.start.format();
                var endDateTime = event.end.format();
                var viewObject = $('#calendar').fullCalendar('getView');
                var viewName = viewObject.name;
                var fmScriptParam = 'fmp://$/FullCalendar_Scheduler_V01?script=FullCalendar.eventDrop' +
                                    '&$eventID=' + eventID +
                                    '&$titleID=' + titleID +
                                    '&$contentID=' + contentID +
                                    '&$statusID=' + statusID +
                                    '&$user_idID=' + user_idID +
                                    '&$start=' + startDateTime +
                                    '&$end=' + endDateTime +
                                    '&$viewName=' + viewName;
                window.location = fmScriptParam;
              },

              
                    
            
            });
        }
    });
});



$(function() {
    $(document).on('click', '.sign_button', function() {
      $('.sign_modal_wrapper').show();
      $('.sign_modal').show();
      if ($(this).hasClass('sign_up_button')) {
        $('.sign_up_modal').show();
      } else {
        $('.sign_in_modal').show();
      }
    });
  });

  $(document).on('click', '.sign_modal_wrapper, .fa_wrapper', function() {
    $('.sign_modal_wrapper').hide();
    $('.sign_modal').hide();
    $('.sign_modal_content').hide();
})







$(function(){
    $fileField = $('#file')
   
    // 選択された画像を取得し表示
    $($fileField).on('change', $fileField, function(e) {
      file = e.target.files[0]
      reader = new FileReader(),
      $preview = $("#img_field");
   
      reader.onload = (function(file) {
        return function(e) {
          $preview.empty();
          $preview.append($('<img>').attr({
            src: e.target.result,
            width: "100%",
            class: "preview",
            title: file.name
          }));
        };
      })(file);
      reader.readAsDataURL(file);
    });
  });