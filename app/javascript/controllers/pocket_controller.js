import { Controller } from "stimulus"


export default class extends Controller {
  static targets = [ ]

  close(){
    console.log('ok')
    this.element.remove()
  }


}


