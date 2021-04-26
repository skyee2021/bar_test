// import { loadCSPNonce } from "@rails/ujs"
// import { defaults } from 'autoprefixer'
import axios from 'axios'

console.log('333');

document.addEventListener('DOMContentLoaded', () =>{
  // console.log(123);
  let likeBtn =document.querySelector('#like-btn')
  

  if (likeBtn){
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token').content
    ax.defaults.headers.common['X-CSRF-Token'] = token

    likeBtn.addEventListener('click',(e) =>{
      // console.log(123);
      let btn =e.target;
      // let id = likeBtn.dataset['id']
      let id = btn.dataset['id']
      console.log(id)
      // 只要html有data屬性就可以拿出來使用
      ax.post(`/bars/${id}/pocket_list`)
        .then(res => {
          console.log(res.data)
          if (res.data.status == 'added') {
            // console.log('added')
            console.log(btn.classList)
            btn.classList.add('like')
          }else{
            console.log(btn.classList)
            btn.classList.remove('like')
          }
          
        })
        .catch(err => {
          console.log(err)
        })


    })
  }
  
})