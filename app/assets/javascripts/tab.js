$(function() {

  var tabMenu = function() {

    /**
     * 変数の指定
     * $tabs              : tabの親要素のjQueryオブジェクト
     * $content           : tabによって切り替わる要素のjQueryオブジェクト
     * TAB_ACTIVE_CLASS   : tabが選択されたスタイルを変更するclass名
     * CONTENT_SHOW_CLASS : contentを表示させるためのclass名
     * id_arr             : $contentのIDを配列に格納
     */
    var $tabs              = $('.tabs');
    var $content           = $('.tab-content');
    var TAB_ACTIVE_CLASS   = 'is_active';
    var CONTENT_SHOW_CLASS = 'is_show';
    var id_arr             = $content.map(function() { return '#' + $(this).attr('id');}).get();


    /**
     * 該当するhashデータがある場合、hashを返す
     * 該当とは id_arr[] に含まれるもの
     * @return {string} 該当する場合
     * @return {false} 該当しない（存在しない）場合
     */
    var getHash = function() {
      var hash = window.location.hash;
      var index = id_arr.indexOf(hash);

      if (index === -1) {
        return false;
      } else {
        return id_arr[index];
      }
    };


    /**
     * ページ読み込み時に実行
     * 1. hashがあれば、hashをhrefに持つタブのスタイル変更（専用のclass付与）
     * 2. hashがあれば、hashをidに持つコンテンツを表示（専用のclassを付与）
     * 3. hashがなければ、タブの先頭が選択された状態とする
     */
    var initialize = function() {
      var hash = getHash();

      if (hash) {
        $tabs.find('a[href="'+hash+'"]').addClass(TAB_ACTIVE_CLASS); // 1
        $(hash).addClass(CONTENT_SHOW_CLASS); // 2
      } else {
        $tabs.find('li:first > a').addClass(TAB_ACTIVE_CLASS); // 3
        $($content[0]).addClass(CONTENT_SHOW_CLASS); // 3
      }
    };


    /**
     * タブのクリックイベント
     * 1. クリックされたタブのhref, 該当するcontentを取得
     * 2. 既にクリック済みの状態であればスキップ
     * 3. 一旦タブ・contentの専用classを全削除
     * 4. クリックしたタブのスタイルを変更、該当するcontentを表示（それぞれ専用のclassを付与）
     */
    var addEvent = function() {
      $tabs.find('a').on('click', function() {
        var href = $(this).attr('href'); // 1
        var $targetContent = $(href); // 1

        // 2
        if ($(this).hasClass(TAB_ACTIVE_CLASS)) {
          return false;
        }

        // 3
        $tabs.find('a').removeClass(TAB_ACTIVE_CLASS);
        $content.removeClass(CONTENT_SHOW_CLASS);

        // 4
        $(this).addClass(TAB_ACTIVE_CLASS);
        $targetContent.addClass(CONTENT_SHOW_CLASS);

        return false;
      });
    };

    return [initialize(), addEvent()];
  };

  // 実行
  tabMenu();

});
