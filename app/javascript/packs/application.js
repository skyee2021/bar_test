
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()


// import '../frontend'
// import '../styles'

// import { library, dom } from '@fortawe/fontawesome-svg-core'
//灰灰的表示沒有用

// import { library, dom } from '@fortawesome/fontawesome-svg-core'
// import { faUserAstronaut } from '@fortawesome/free-solid-svg-icons'

// library.add(faUserAstronaut)

// dom.watch()


import 'icon/fontawesome'
import '../styles/frontend/form.scss'
import '../styles'