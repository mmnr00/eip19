$(document).on('turbolinks:load', function() {
  // "use strict";
  // console.log('q-a js')

  // const musrehan = "Mustakhim Rehan"
  


  // const btnd = document.querySelector('#tryclick');
  // if (typeof btnd === 'undefined'){
    
  // } else {
  //   btnd.addEventListener('click', function (){
  //     console.log("try click-click")
  //   })
  // }

  const allq = document.querySelector('#allq');
  const schq = document.querySelector('#schq');
  const schbox = document.querySelector('.schbox');
  const submitQa = document.querySelector('#submitQa');
  var str = '';

  function loopChild (strPar){
    var c = schq.children
    var i;
    var j;
    for (i = 0; i < c.length; i++) {
      c[i].style.display = 'none'
    }
    for (j = 0; j < c.length; j++) {
      var dv = c[j]
      var strId = c[j].id
      if (strId.includes(strPar)){
        c[0].style.display = "inline"
        dv.style.display = 'inline'
        submitQa.style.display = 'none'
      } else {
        submitQa.style.display = 'inline'
      }
      
    }
  }



  if (typeof schbox === 'undefined'){
  } else {
    schbox.addEventListener('keydown', function (e){

      if (e.key === 'Backspace'){
        str = str.substring(0, str.length - 1);
        loopChild(str)
      } else {
        str += e.key.toUpperCase()
      }
      
      
      if (str.length > 0){
        console.log(str)
        console.log(schq)
        allq.style.display = 'none'
        schq.style.display = 'inline'
        loopChild(str)
        
      } else {
        allq.style.display = 'inline'
        schq.style.display = 'none'
      }
    }) // for event listener

  } // IF SCHBOX present


    


})