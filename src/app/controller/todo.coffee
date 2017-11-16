export default (app) ->

  class TodoController extends app.Controller
  
    constructor: (ctx) ->
      super ctx
      @
    
    test: ->
      { ctx } = @

      ctx.body = await ctx.service.todo.test ctx.request.body
        
  return TodoController