import 'shelljs/make'
import dd from 'ddeyes'
import { 
  LC_service
  local_service
  redux_test
} from 'class-todo-redux/dist/bundle'

import {
  LC_userService
  local_userService
  redux_userTest
} from 'user-todo-redux/dist/bundle'

#### class todo ####
# leanCloud service
target.class_lc_service = ->
  LC_service()

# local service to leanCloud
target.class_local_service = ->
  local_service()

# class redux test
target.class_redux_static = ->
  redux_test.staticFuc()

target.class_redux_reducers = ->
  redux_test.reducersFuc()

target.class_redux_sagas = ->
  promiseFuc = ->
    new Promise (resolve, reject) ->
      redux_test.createFuc(resolve, reject)
    .then (data) ->
      await redux_test.sellp 2000
      redux_test.fetchFuc data

      await redux_test.sellp 2000
      redux_test.patchFuc data

      await redux_test.sellp 2000
      redux_test.reloadFuc()

      await redux_test.sellp 2000
      redux_test.removeFuc data
      
  promiseFuc()

#### user ####
# leancloud user service
target.user_lc_service = ->
  LC_userService()

# local user service 
target.user_local_service = ->
  local_userService()

# user redux test
target.user_redux_static = ->
  redux_userTest.staticFuc()

target.user_redux_reducers = ->
  redux_userTest.reducersFuc()

target.user_redux_sagas = ->
  promiseFuc = ->
    new Promise (resolve, reject) ->
      redux_userTest.createFuc(resolve, reject)
    .then (data) ->
      await redux_userTest.sellp 2000
      redux_userTest.loginFuc data

      await redux_userTest.sellp 2000
      redux_userTest.fetchFuc data

      # await redux_userTest.sellp 2000
      # redux_userTest.patchFuc data

      await redux_userTest.sellp 2000
      redux_userTest.reloadFuc()

      await redux_userTest.sellp 2000
      redux_userTest.removeFuc data
      
  promiseFuc()