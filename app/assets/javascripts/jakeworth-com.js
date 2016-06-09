$(function(){

  function debounce(func, wait, immediate) {
    var timeout;
    return function() {
      var context = this, args = arguments;
      var later = function() {
        timeout = null;
        if (!immediate) func.apply(context, args);
      };
      var callNow = immediate && !timeout;
      clearTimeout(timeout);
      timeout = setTimeout(later, wait);
      if (callNow) func.apply(context, args);
    };
  };

  var renderMarkdown = function(){
    var txt = $("#post_body").val();
    $.post("/body_preview", {body: txt}, function(result){
      $(".content").html(result);
    });
  };

  var renderTitle = function(){
    var txt = $("#post_title").val();
    $('.title_preview').text(txt);
  };

  var renderSlug = function(){
    var slug = $("#post_url_slug").val();

    if (slug.length > 0) {
      $(".slug_preview").html(slug);
    } else {
      var txt = $("#post_title").val();
      $.post("/slug_preview", {title: txt}, function(result){
        $(".slug_preview").html(result);
      });
    }
  };

  $('#post_body').on('keyup', debounce(renderMarkdown, 350)).each(renderMarkdown);
  $('#post_title').on('keyup', debounce(renderSlug, 500)).each(renderSlug);
  $('#post_url_slug').on('keyup', debounce(renderSlug, 500)).each(renderSlug);
  $('#post_title').on('keyup', renderTitle).each(renderTitle);
});
