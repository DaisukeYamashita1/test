import $ from 'jquery';

$(document).on('turbolinks:load', function() {

  $("#pagetop").hide();

  $(window).scroll(function () {
    if ($(this).scrollTop() > 32) {
      $('.side-menu').addClass('fixed');
    } else {
      $('.side-menu').removeClass('fixed');
    }
  });

  $(window).scroll(function () {
    if ($(this).scrollTop() > 100) {
        $('#pagetop').fadeIn();
    } else {
        $('#pagetop').fadeOut();
    }
  });

  $('#pagetop a').click(function () {
      $('body,html').animate({
          scrollTop: 0
      }, 800);
      return false;
  });  

  const heads = document.querySelectorAll('h2, h3, h4, h5, h6');
  if (heads && heads.length) {
      let contents = '';
      heads.forEach((head, i) => {
        let className = '';
        switch(head.localName) {
            case "h2":
                className = `contents2`;
                break;
            case "h3":
                className = `contents3`;
                break;
            case "h4":
                className = `contents4`;
                break;
            case "h5":
                className = `contents5`;
                break;
            case "h6":
                className = `contents6`;
                break;
        }
        
        contents += `<li><a class="${className}" href="#head${i}">${head.textContent}</a></li>`;
        head.innerHTML += `<a id="head${i}"></a>`;
      })
      document.querySelector('#table-of-content').innerHTML += `<ol>${contents}</ol>`;
  }  

  $(function() {
    // .tabがクリックされたときを指定
    $('.tab').click(function(){
      // 今ある.tab-activeを削除
      $('.tab-active').removeClass('tab-active');
      // クリックされた.tabに.tab-activeを追加
      $(this).addClass('tab-active');
      // 今ある.box-showを削除
      $('.box-show').removeClass('box-show');
      // indexに.tabのindex番号を代入
      const index = $(this).index();
      // .tabboxとindexの番号が同じ要素に.box-showを追加
      $('.tabbox').eq(index).addClass('box-show');
    });
  });

  $('#openModal01').click(function(){
    $('#modalArea01').fadeIn();
  });
  $('#closeModal01 , #modalBg01').click(function(){
    $('#modalArea01').fadeOut();
  });  

  $('#openModal02').click(function(){
    $('#modalArea02').fadeIn();
  });
  $('#closeModal02 , #modalBg02').click(function(){
    $('#modalArea02').fadeOut();
  }); 

  $('#openModal03').click(function(){
    $('#modalArea03').fadeIn();
  });
  $('#closeModal03 , #modalBg03').click(function(){
    $('#modalArea03').fadeOut();
  });  

  $('#openModal04').click(function(){
    $('#modalArea04').fadeIn();
  });
  $('#closeModal04 , #modalBg04').click(function(){
    $('#modalArea04').fadeOut();
  }); 

  $('#openModal05').click(function(){
    $('#modalArea05').fadeIn();
  });
  $('#closeModal05 , #modalBg05').click(function(){
    $('#modalArea05').fadeOut();
  });  

  $('#openModal06').click(function(){
    $('#modalArea06').fadeIn();
  });
  $('#closeModal06 , #modalBg06').click(function(){
    $('#modalArea06').fadeOut();
  }); 

  $('#openModal07').click(function(){
    $('#modalArea07').fadeIn();
  });
  $('#closeModal07 , #modalBg07').click(function(){
    $('#modalArea07').fadeOut();
  });  

  $('#openModal08').click(function(){
    $('#modalArea08').fadeIn();
  });
  $('#closeModal08 , #modalBg08').click(function(){
    $('#modalArea08').fadeOut();
  }); 

  $('#openModal09').click(function(){
    $('#modalArea09').fadeIn();
  });
  $('#closeModal09 , #modalBg09').click(function(){
    $('#modalArea09').fadeOut();
  }); 
  
  $('#openModal10').click(function(){
    $('#modalArea10').fadeIn();
  });
  $('#closeModal10 , #modalBg10').click(function(){
    $('#modalArea10').fadeOut();
  });   

});
