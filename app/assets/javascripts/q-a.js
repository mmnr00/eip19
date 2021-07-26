$(document).on('turbolinks:load', function() {
  // "use strict";
  console.log('q-a js')

  // const musrehan = "Mustakhim Rehan"
  


  // const btnd = document.querySelector('#tryclick');
  // if (typeof btnd === 'undefined'){
    
  // } else {
  //   btnd.addEventListener('click', function (){
  //     console.log("try click-click")
  //   })
  // }

  const schbox = document.querySelector('.schbox');
  if (typeof schbox === 'undefined'){
  } else {
    var str = ''
    schbox.addEventListener('keydown', function (e){
      



      if (e.key === 'Backspace'){
        str = str.substring(0, str.length - 1);
      } else {
        str += e.key
      }
      
      console.log(str)
    })

  }
    


})