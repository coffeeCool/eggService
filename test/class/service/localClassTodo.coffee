import config from '../../../src/app/config/config.default'
import { services as localService } from 'class-todo-redux/dist/bundle'
localSer = localService()

create = ->
  localSer.create
    headers: config.leanCloud.headers
    uri: "#{config.localhost.uri}/classes"
    data:
      company: '举手帮租有限公司'
      main: '租房'
      location: '武汉'

fetch = (data)->
  localSer.fetch 
    headers: config.leanCloud.headers
    uri: "#{config.localhost.uri}/classes/#{data.objectId}"

patch = (data) ->
  localSer.patch 
    headers: config.leanCloud.headers
    uri: "#{config.localhost.uri}/classes/#{data.objectId}"
    data:
      company: '阿里巴巴有限公司'
      main: '租房大佬'
      location: '武汉'
    
reload = ->
  localSer.reload
    headers: config.leanCloud.master_headers
    uri: "#{config.localhost.uri}/#{config.className}"

remove = (objectId) ->
  localSer.remove 
    headers: config.leanCloud.headers
    uri: "#{config.localhost.uri}/#{config.className}/#{objectId}"

getIds = (data) ->
  data.reduce (r, c) ->
    [
      r...
      c.objectId
    ]
  , []

export {
  create
  fetch
  patch
  reload
  remove
  getIds
}
# import dd from 'ddeyes'
# import toolFuc from '../src/app/extend/helper'

# localCreateClass = (data)->
#   toolFuc(
#     'POST'
#     data.headers
#     "#{data.uri}/classes"
#     data.data
#   )

# localGetClassOneTodo = (data)->
#   toolFuc(
#     'GET'
#     data.headers
#     "#{data.uri}/classes/#{data.objectId}"
#     data.data
#   )

# localUpdClassTodo = (data)->
#   toolFuc(
#     'PUT'
#     data.headers
#     "#{data.uri}/classes/#{data.objectId}"
#     data.data
#   )

# localDelClassTodo = (data)->
#   toolFuc(
#     'DELETE'
#     data.headers
#     "#{data.uri}/classes/#{data.objectId}"
#     data.data
#   )

# export {
#   localCreateClass
#   localGetClassOneTodo
#   localUpdClassTodo
#   localDelClassTodo
# }