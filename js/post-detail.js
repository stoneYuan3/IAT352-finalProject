
$('document').ready(function(){
  const urlParams = new URLSearchParams(window.location.search);
  const pid = urlParams.get('post');
  console.log(pid);  	

  pullPostDetail(pid);

});