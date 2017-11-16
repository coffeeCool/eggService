import 'shelljs/make'
import dd from 'ddeyes'
import { classTodo } from './classTodo'
import { userTodo } from './userTodo'

target.classTodo = ->
  classTodo()

target.userTodo = ->
  userTodo()