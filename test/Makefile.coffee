import 'shelljs/make'
import dd from 'ddeyes'
import config from '../src/app/config/config.default'
import { classTodo } from './class/service/classTodo'
import { userTodo } from './user/service/userTodo'
import {
  localClassReduxSagas
} from './class/redux/classTodoRedux'

import { 
  create
  fetch
  patch
  reload
  remove
  getIds
} from './class/service/localClassTodo'

import {
  localUserLogin
  localCreateUser
  localGetUser
  localUpdUser
  localDelUser
} from './user/service/localUserTodo'

import { 
  classTodoStatic
  classTodoReducers
  classTodoSagas
} from './class/redux/classTodoRedux'

import {
  userTodoStatic
  userTodoReducers
  userTodoSagas
} from './user/redux/userTodoRedux'

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

target.localClassReduxSagas =->
  localClassReduxSagas()
  
# user todo redux
target.userTodoStatic = ->
  userTodoStatic()

target.userTodoReducers = ->
  userTodoReducers()

target.userTodoSagas = ->
  userTodoSagas()

# local class todo service
target.localClassTest = ->
  data_create = await create()
  data_create
  dd data_create

  # data_fetch = await fetch data_create
  # dd data_fetch
  
  # data_upd = await patch data_create
  # data_upd
  # dd data_upd

  # data_reload = await reload()
  # data_reload
  # dd data_reload

  # data_ids = await getIds(data_reload.results)
  # for id in data_ids
  #   data_remove = await remove id
  #   dd data_remove

# local user todo service
target.localUserTest = ->
  data_create = await localCreateUser(
    headers: config.source.leanCloud.headers
    uri: config.source.localhost.uri
    data:
      username: '何S'
      password: '123456'
  )
  dd data_create

  data_login = await localUserLogin(
    headers: config.source.leanCloud.headers
    uri: config.source.localhost.uri
    data:
      username: '何S'
      password: '123456'
  )
  data_login
  dd data_login

  data_getUser = await localGetUser(
    headers: config.source.leanCloud.headers
    uri: config.source.localhost.uri
    data:
      objectId: data_login.objectId
  )
  dd data_getUser

  data_upd = await localUpdUser(
    headers:
      'Content-Type': 'application/json'
      'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
      'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      'X-LC-Session': "#{data_login.sessionToken}"
    uri: config.source.localhost.uri
    data:
      sessionToken: data_login.sessionToken  
      objectId: data_login.objectId
      username: '陈欢'
      password: '123456'
  )
  data_upd
  dd data_upd

  data_del = await localDelUser(
    headers:
      'Content-Type': 'application/json'
      'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
      'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      'X-LC-Session': "#{data_upd.sessionToken}"
    uri: config.source.localhost.uri
    data:
      sessionToken: data_upd.sessionToken  
      objectId: data_upd.objectId
  )
  dd data_del
  
