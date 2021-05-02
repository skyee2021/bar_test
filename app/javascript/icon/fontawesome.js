import { library, dom } from '@fortawesome/fontawesome-svg-core'
import {
  faUserAstronaut,
  faHeart,
  faRocket,
  
  faTimes
  

} from '@fortawesome/free-solid-svg-icons'

import {
  faThumbsUp,
  faTimesCircle
} from '@fortawesome/free-regular-svg-icons'



library.add(
  faUserAstronaut,
  faHeart,
  faRocket,
  faThumbsUp,
  faTimes,
  faTimesCircle
)

dom.watch()
