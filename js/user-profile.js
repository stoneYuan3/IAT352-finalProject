
$('document').ready(function(){
  const urlParams = new URLSearchParams(window.location.search);
  const uid = urlParams.get('userid');
  console.log(uid);  	
  pullUserProfile(uid);

});