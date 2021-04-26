// import { loadCSPNonce } from "@rails/ujs"
import axios from 'axios'

document.addEventListener('DOMContent', () =>{
  // console.log(123);
  let likeBtn =document.querySelector('#like-btn')
  if (likeBtn){
    let ax = axios.create()
    likeBtn.addEventListener('click',() =>{
      console.log(123);
      

    })
  }
  
})