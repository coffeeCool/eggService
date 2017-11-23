import dd from 'ddeyes'
import 'shelljs/make'
import { store } from 'user-todo-redux/dist/bundle'

config =
  headers:
    'Content-Type': 'application/json'
    'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
    'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
  uri: "https://xy1g1vfw.api.lncld.net/1.1"

{
  constants
  actions
  reducers
  sagas
  getStore
} = store

userTodoStatic = ->
  dd {
    constants
    actions
  }

userTodoReducers = ->
  myStore = getStore {
    appName: 'userTodoReduxApp'
    reducers
    subscriber:
      sync: ->
        dd myStore.getState()
  }

  myStore.dispatch actions.userSave
    data: [
     username: '何文涛'
     password: '123456'
    ]

  myStore.onsubscribe()

userTodoSagas = ->
  subscriber = (
    prevState
    nextState
    action
    dispatch
  ) ->
    dd @getState()

  myStore = getStore {
    appName: 'userTodoReduxApp'
    reducers
    sagas
    subscriber:
      async: subscriber
  }
  
  myStore.dispatch actions.userCreate {
    headers: config.headers
    uri: config.uri
    data:
      username: '何文涛'
      password: '123456'
  }

  # myStore.dispatch actions.userFetch {
  #   headers: config.headers
  #   uri: config.uri
  #   objectId: '5a0fca8c2f301e006513d681'
  # }

  # myStore.dispatch actions.userLogin {
  #   headers: config.headers
  #   uri: config.uri
  #   data:
  #     username: '何文涛'
  #     password: '123456'
  # }

  # myStore.dispatch actions.userPatch {
  #   headers:
  #     'Content-Type': 'application/json'
  #     'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
  #     'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
  #     'X-LC-Session': 'vsk7r3qs9ka8kpehp5rrijf2l'
  #   uri: config.uri
  #   objectId: '5a0fca8c2f301e006513d681'
  #   data:
  #     username: '陈欢'
  #     password: '123456'
  # }

  # myStore.dispatch actions.userRemove {
  #   headers:
  #     'Content-Type': 'application/json'
  #     'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
  #     'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
  #     'X-LC-Session': 'vsk7r3qs9ka8kpehp5rrijf2l'
  #   uri: config.uri
  #   objectId: '5a0fca8c2f301e006513d681'
  # }

export {
  userTodoStatic
  userTodoReducers
  userTodoSagas
}

