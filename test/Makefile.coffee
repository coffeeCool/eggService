import 'shelljs/make'
import dd from 'ddeyes'
import { classTodo } from './classTodo'
import { userTodo } from './userTodo'
import { 
  classTodoStatic
  classTodoReducers
  classTodoSagas
} from './classTodoRedux' 
import {
  userTodoStatic
  userTodoReducers
  userTodoSagas  
} from './userTodoRedux'

target.classTodo = ->
  classTodo()

target.userTodo = ->
  userTodo()

# class todo redux
target.classTodoStatic = ->
  classTodoStatic()

target.classTodoReducers = ->
  classTodoReducers()

target.classTodoSagas = ->
  classTodoSagas()

# user todo redux
target.userTodoStatic = ->
  userTodoStatic()

target.userTodoReducers = ->
  userTodoReducers()

target.userTodoSagas = ->
  userTodoSagas()