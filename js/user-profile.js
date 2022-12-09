
$('document').ready(function(){
  const urlParams = new URLSearchParams(window.location.search);
  const uid = urlParams.get('userid');
  var loginID=null;
  var type='posts';

  checkLogin().done(function(data){   
    if(data=='not_loggedIn'){
      pullUserProfile(uid,type,null);
      pullUserWork(uid,type,null);
    }
    else{
      loginID=data;
      pullUserProfile(uid,type,loginID);
      pullUserWork(uid,type,loginID);
    }

    //TBD:let filterby work with upper level filters
    //idea: set type, filter, keyword as global variables. whenever user click something, set those variables to corresponding values (i.e, click image set filter=image), send all variables to backend whenever something is clicked)

    $('.select-posts').click(function(){
      type="posts";
      $('.select-posts').addClass('style-selected-underline');
      $('.select-collect').removeClass('style-selected-underline');
      console.log(type);
      pullUserWork(uid,type,loginID);
    });

    $('.select-collect').click(function(){
      type="collection";
      $('.select-posts').removeClass('style-selected-underline');
      $('.select-collect').addClass('style-selected-underline');    
      console.log(type);
      pullUserWork(uid,type,loginID);
    });

    $('#button-index-FilterBy').click(function(){
      var keyword=$('#input-filter').val();
      pullUserWork(uid,type,loginID,'tag',keyword);
      $('#button-index-All').addClass('selected');
      $('#button-index-Images').removeClass('selected');
      $('#button-index-Articles').removeClass('selected');
    });


    $('#button-index-All').click(function(){
      pullUserWork(uid,type,loginID);    
      $('#button-index-All').addClass('selected');
      $('#button-index-Images').removeClass('selected');
      $('#button-index-Articles').removeClass('selected');
    });


    $('#button-index-Images').click(function(){
      $('#button-index-Images').addClass('selected');
      $('#button-index-All').removeClass('selected');
      $('#button-index-Articles').removeClass('selected');
      pullUserWork(uid,type,loginID,'image');  
    });

    $('#button-index-Articles').click(function(){
      $('#button-index-Articles').addClass('selected');
      $('#button-index-All').removeClass('selected');
      $('#button-index-Images').removeClass('selected');
      pullUserWork(uid,type,loginID,'articles');  
    });

  }); 
  checkLogin().fail(function(data){
    console.log('fail, '+data);
  });
});