$(function() {
  $('.tag-list').on('click', function(e){
    if($(event.target).closest('#highschool').length){
      var gen = $(this).attr("id");
      $(".articles-container").empty()
      searchLimit(gen)
    }
  })
  function searchLimit(gen) {
    if (gen == "highschool") {
      console.log("aaa")

    } else {

    }
  }
})
