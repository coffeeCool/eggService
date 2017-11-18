import 'shelljs/make'
import dd from 'ddeyes'
import { classTodo } from './classTodo'
import { userTodo } from './userTodo'
import { 
  classTodoStatic
  classTodoReducers
  classTodoSagas
} from './classTodoRedux' 

target.classTodo = ->
  classTodo()

target.userTodo = ->
  userTodo()

target.classTodoStatic = ->
  classTodoStatic()

target.classTodoReducers = ->
  classTodoReducers()

target.classTodoSagas = ->
  classTodoSagas()