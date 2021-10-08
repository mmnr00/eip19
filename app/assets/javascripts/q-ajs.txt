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

  console.log('q-a js')

  const allq = document.querySelector('#allq');
  const schq = document.querySelector('#schq');
  const schbox = document.querySelector('.schbox');
  const submitQa = document.querySelector('#submitQa');
  var str = '';

  function loopChild (strPar){
    var c = schq.children
    var i;
    var j;
    var notFound = 0

    for (i = 0; i < c.length; i++) {
      c[i].style.display = 'none'
    }
    for (j = 0; j < c.length; j++) {
      var dv = c[j]
      var strId = c[j].id
      if (strId.includes(strPar)){
        
        dv.style.display = 'inline'
        submitQa.style.display = 'none'
      } else {
        
        notFound++
        submitQa.style.display = 'inline'
      }
      c[0].style.display = "block"
    }
    if (notFound == c.length){
      schq.style.display = 'none'
    }
    
  }



  if (typeof schbox === 'undefined'){
  } else {
    schbox.addEventListener('keydown', function (e){
      if ((e.keyCode == 32) || (e.keyCode >= 48 && e.keyCode <= 57) || (e.keyCode >= 65 && e.keyCode <= 90) || (e.keyCode == 8)){
        // console.log(e.keyCode)
        if (e.key === 'Backspace'){
          str = str.substring(0, str.length - 1);
          loopChild(str)
        } else {
          str += e.key.toUpperCase()
        }
      }
      
      
      
      if (str.length > 0){
        console.log(str)
        // console.log(schq)
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