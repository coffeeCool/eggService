import 'shelljs/make'
import dd from 'ddeyes'
import classLocalService from './classLocalService'

import {
  LC_userService
  local_userService
  redux_userTest
} from 'user-todo-redux'

########################### class todo ###########################
# local service to leanCloud
target.classLocalService = ->
  classLocalService()

################################ user ############################
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
  data = await redux_userTest.createFuc()
  data

  await redux_userTest.loginFuc data

  await redux_userTest.fetchFuc data

  await redux_userTest.reloadFuc()

  data_patch = await redux_userTest.patchFuc data
  data_patch

  await redux_userTest.removeFuc data_patch