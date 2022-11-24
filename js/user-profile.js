
$('document').ready(function(){
  const urlParams = new URLSearchParams(window.location.search);
  const uid = urlParams.get('userid');
  console.log(uid);  	
  pullUserProfile(uid);



  $('#button-index-FilterBy').click(function(){
    var keyword=$('#input-filter').val();
    $.ajax({
      type:'POST',
      url:'server/base.php?query=loadUser&uid='+uid+'&tag='+keyword,
      data:{},
      dataType:'text',
      success:function(data){
        var result=JSON.parse(data);    
        $('.section-userWorkDisplay').html(result.userpost);
      },
      error:function(data){
        console.log("an error happened, transaction failed");
      }
    }); 
  });

  $('#button-index-All').click(function(){
    pullUserProfile(uid);    
  });
  $('#button-index-Images').click(function(){
    $.ajax({
      type:'POST',
      url:'server/base.php?query=loadUser&uid='+uid+'&filter=images',
      data:{},
      dataType:'text',
      success:function(data){
        var result=JSON.parse(data);    
        $('.section-userWorkDisplay').html(result.userpost);
      },
      error:function(data){
        console.log("an error happened, transaction failed");
      }
    });     
  });
  $('#button-index-Articles').click(function(){
    $.ajax({
      type:'POST',
      url:'server/base.php?query=loadUser&uid='+uid+'&filter=articles',
      data:{},
      dataType:'text',
      success:function(data){
        var result=JSON.parse(data);    
        $('.section-userWorkDisplay').html(result.userpost);
      },
      error:function(data){
        console.log("an error happened, transaction failed");
      }
    });     
  });

});