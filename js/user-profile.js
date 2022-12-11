
$('document').ready(function(){
  const urlParams = new URLSearchParams(window.location.search);
  const uid = urlParams.get('userid');
  var loginID=null;
  var type='posts';
  var filter=null;
  var tag=null;

  checkLogin().done(function(data){   
    if(data=='not_loggedIn'){
      loginID=null;
      pullUserProfile(uid,type,loginID,filter,tag);
      pullUserWork(uid,type,loginID,filter,tag);
    }
    else{
      loginID=data;
      pullUserProfile(uid,type,loginID,filter,tag);
      pullUserWork(uid,type,loginID,filter,tag);
    }

    $('.select-posts').click(function(){
      type="posts";
      $('.select-posts').addClass('style-selected-underline');
      $('.select-collect').removeClass('style-selected-underline');
      console.log(type);
      pullUserWork(uid,type,loginID,filter,tag);
    });

    $('.select-collect').click(function(){
      type="collection";
      $('.select-posts').removeClass('style-selected-underline');
      $('.select-collect').addClass('style-selected-underline');    
      console.log(type);
      pullUserWork(uid,type,loginID,filter,tag);
    });

    $('#button-index-FilterBy').click(function(){
      var keyword=$('#input-filter').val();
      tag=keyword;
      pullUserWork(uid,type,loginID,filter,tag);
    });


    $('#button-index-All').click(function(){
      filter=null;
      tag=null;
      pullUserWork(uid,type,loginID,filter,tag);    
      $('#button-index-All').addClass('selected');
      $('#button-index-Images').removeClass('selected');
      $('#button-index-Articles').removeClass('selected');
      $('#input-filter').val('');
    });


    $('#button-index-Images').click(function(){
      filter='images';
      $('#button-index-Images').addClass('selected');
      $('#button-index-All').removeClass('selected');
      $('#button-index-Articles').removeClass('selected');
      pullUserWork(uid,type,loginID,filter,tag);  
    });

    $('#button-index-Articles').click(function(){
      filter='articles';
      $('#button-index-Articles').addClass('selected');
      $('#button-index-All').removeClass('selected');
      $('#button-index-Images').removeClass('selected');
      pullUserWork(uid,type,loginID,filter,tag);  
    });

  }); 
  checkLogin().fail(function(data){
    console.log('fail, '+data);
  });
});