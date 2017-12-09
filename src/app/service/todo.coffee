import config from '../config/config.default'
import dd from 'ddeyes'

export default (app) ->
  class TodosService extends app.Service
    constructor: (ctx) ->
      super ctx
      @root = "#{config.leanCloud.classBaseUri}/#{config.leanCloud.className}"
      @

    request: (url, opts) ->
      url = "#{@root}#{url}"
      opts = {
        headers: {
          config.leanCloud.headers...
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
    create: (params) ->
      result = await @request "?fetchWhenSave=true"
      ,
        method: 'post'
        data: params
        dataType: 'json'

      result.data
      
    # get the class one todo information
    fetch: (params) ->
      result = await @request "/#{params.objectId}"
      ,
        method: 'get'
        data: params
        dataType: 'json'

      result.data

    # get the class todos information
    reload: (params) ->
      result = await @request ""
      ,
        method: 'get'
        data: params
        dataType: 'json'

      result.data

    # updata the class todo
    patch: (params) ->
      result = await @request "/#{params.objectId}?fetchWhenSave=true"
      ,
        method: 'put'
        data: params
        dataType: 'json'
      
      result.data

    # delete the class todo
    remove: (params) ->
      result = await @request "/#{params.objectId}"
      ,
        method: 'delete'
        data: params
        dataType: 'json'

      result.data