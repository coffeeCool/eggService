import dd from 'ddeyes'
import 'shelljs/make'
import { store } from 'class-todo-redux/dist/bundle'

config =
  headers:
    'Content-Type': 'application/json'
    'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
    'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
  uri: "https://xy1g1vfw.api.lncld.net/1.1/classes"
  className: 'Todos'

{
  constants
  actions
  reducers
  sagas
  getStore
} = store

classTodoStatic = ->
  dd {
    constants
    actions
  }

classTodoReducers = ->
  myStore = getStore {
    appName: 'classTodoApp'
    reducers
    subscriber:
      sync: ->
        dd myStore.getState()
  }

  myStore.dispatch actions.classSave
    data: [
     company: '武汉和风和乐有限公司'
      main: '旅游、租房'
      location: '武汉'
    ]

  myStore.onsubscribe()

localClassReduxSagas = ->
  subscriber = (
    prevState
    nextState
    action
    dispatch
  ) ->
    dd @getState()

  myStore = getStore {
    appName: 'classTodoApp'
    reducers
    sagas
    subscriber:
      async: subscriber
  }
  
  myStore.dispatch actions.classFetch
    headers: config.headers
    uri: "http://192.168.0.192:7001/classes/5a151d84ee920a004468bf54" 
    data:
      className: config.className
      objectId: '5a151d84ee920a004468bf54'


  # myStore.dispatch actions.classFetch {
  #   headers: config.headers
  #   uri: config.uri
  #   className: config.className
  #   objectId: '5a123c52ee920a004537c6a0'
  # }

  # myStore.dispatch actions.classPatch {
  #   headers: config.headers
  #   uri: config.uri
  #   className: config.className
  #   objectId: '5a123c52ee920a004537c6a0'
  #   data:
  #     company: '阿里巴巴有限公司'
  #     main: '租房大佬'
  #     location: '武汉'
  # }

  # myStore.dispatch actions.classRemove {
  #   headers: config.headers
  #   uri: config.uri
  #   className: config.className
  #   objectId: '5a123c52ee920a004537c6a0'
  # }

export {
  localClassReduxSagas
}

