import config from '../config/config.default'
import sha1 from 'sha1'

export default (app) ->
  class WechatController extends app.Controller
    constructor: (ctx) ->
      super ctx
      @
    
    oauth: ->
      { ctx } = @

      ctx.body = await ctx.service.wechat.oauth @ctx.query
    
    access_token: ->
      { ctx } = @
      
      ctx.body = await ctx.service.wechat.access_token ctx.request.body

    menu: ->
      { ctx } = @

      ctx.body = await ctx.service.wechat.menu ctx.request.body

  return WechatController