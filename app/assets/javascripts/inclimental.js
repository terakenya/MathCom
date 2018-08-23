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
  function appendMore(searchword){
    var html =`
              <form class="form_more" method="get" action="/articles">
                <button class="button_more" type="submit">
                  もっと見る
                </button>
                <input type="hidden" name="keywordSearch" value="${searchword}">
              </form>
              `
    return html
  }

  $("#searchbox").on("keyup", function() {
    var input = $.trim($(this).val());
    if(input !=""){
      $.ajax({
        type: 'GET',
        url: '/questions/search',
        data: { keyword: input },
        dataType: 'json'
      })
      .done(function(questions) {
        if(questions.length != 0 && input!=false){
        $(".articles-container").empty();
        $(".article-pagenate").empty();
          questions.forEach(function(question){
            var html = appendQuestion(question);
            $('.articles-container').append(html);
          });
          var html = appendMore(input);
          $('.article-pagenate').append(html);
        };
      })
    } else {
      $(".articles-container").empty();
      $(".article-pagenate").empty();
    }
  })
})
