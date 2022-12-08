
$('document').ready(function(){
  const urlParams = new URLSearchParams(window.location.search);
  const pid = urlParams.get('post');
  console.log(pid);  
  var loginID=null;
  checkLogin().done(function(data){   
    if(data=='not_loggedIn'){
      pullPostDetail(pid,null);
    }
    else{
      loginID=data;
      pullPostDetail(pid,loginID);
    }
  });
  checkLogin().fail(function(data){
   console.log(data);
  });
});