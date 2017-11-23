import source from '../config/config.default.coffee'
import dd from 'ddeyes'
import { services as getClassServ } from 'class-todo-redux/dist/bundle'
classServ = getClassServ()

export default (app) ->

  class ClassesService extends app.Service

    constructor: (ctx) ->
      super ctx
      @root = source.source.leanCloud.classBaseUri
      @

    request: (url, opts) ->
      url = "#{@root}#{url}"
      opts = {
        headers: {
          source.source.leanCloud.headers...
          (
            do ->
              if opts?.headers_extra?
              then opts.headers_extra
              else {}
          )...
        }
        opts...
      }
      await @ctx.curl url, opts

    # create class todo and return this class todo
    createClass: (params) ->
      classServ.create(
        {
          headers: source.source.leanCloud.headers
          uri: "#{source.source.leanCloud.classBaseUri}/#{source.source.leanCloud.className}?fetchWhenSave=true"
          data: params
        }
      )


    # get the class one todo information
    getClassOneTodo: (params) ->
      result = await @request "/#{params.className}/#{params.objectId}"
      ,
        method: 'get'
        data: params
        dataType: 'json'

      result.data

    # updata the class todo
    updateClassTodo: (params) ->
      result = await @request "/#{params.className}/#{params.objectId}?fetchWhenSave=true"
      ,
        method: 'put'
        data: params
        dataType: 'json'
      
      result.data

    # delete the class todo
    deleteClassTodo: (params) ->
      result = await @request "/#{params.className}/#{params.objectId}"
      ,
        method: 'delete'
        data: params
        dataType: 'json'

      result.data

