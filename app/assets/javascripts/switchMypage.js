$(function() {
  jadge = true
  $(document).click(function(event) {
    if(!$(event.target).closest('.mypage-menu').length && jadge == false) {
      $('.mypage-menu').not(":animated").fadeToggle(10)
      jadge = true
    } else if($(event.target).closest('.smile').length && jadge == true){
      $('.mypage-menu').not(":animated").fadeToggle(10)
      jadge = false
    }
  });
});
