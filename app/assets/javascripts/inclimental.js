$(function() {
  function appendQuestion(question) {
    var html = `
                <div class="article">
                <div class="article-title">${question.title}</div>
                <div class="article-description">${question.unko}</div>
                <div class="article-posttime">
                  2018/07/24(Tuesday)
                </div>
                <div class="article-tags">
                  <ul>
                    <li class="article-tag"></li>
                    <li class="article-tag">
                      三角関数
                    </li>
                    <li class="article-tag">
                      グラフ
                    </li>
                  </ul>
                </div>
              </div>
              `
    return html
  }

  $("#searchbox").on("keyup", function() {
    var input = $.trim($(this).val());
    $.ajax({
      type: 'GET',
      url: '/articles/search',
      data: { keyword: input },
      dataType: 'json'
    })
    .done(function(questions) {
      $(".articles-container").empty();
      if(questions.length != 0 && input!=false){
        questions.forEach(function(question){
          var html = appendQuestion(question);
          console.log(html)
          $('.articles-container').append(html);
        });
      };
    })
  })
})
