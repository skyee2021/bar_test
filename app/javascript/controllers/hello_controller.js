// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
// import Rails from "@rails/ujs"

export default class extends Controller {
  static targets = [ "btn" ]


  // addToggle(id) {
  //   Rails.ajax({
  //     res => {
  //       console.log(res.data)
  //       if (res.data.status == 'added') {
  //         // console.log('added')
  //         console.log(btn.classList)
  //         btn.classList.add('like')
  //       }else{
  //         console.log(btn.classList)
  //         btn.classList.remove('like')
  //       } 
  //     }

  //   })
  // }

  add(){
    // console.log('add!');
    // console.log(this.btnTarget.dataset['id']);
    // this.btnTarget.toggle('like')
    // this.addToggle();
  }

  //客製化事件
  // var event = new CustomEvent("hey", {
  //   detail: {
  //     areyousure: true
  //   }
  // })

  add(){
    console.log('add!');
  }

  // connect() {
  //   // this.outputTarget.textContent = 'Hello, Stimulus!'
  //   console.log('add!');
  // }

  
}
