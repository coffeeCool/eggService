export default (app) ->

  class UsersController extends app.Controller
  
    constructor: (ctx) ->
      super ctx
      @

    login: ->
      { ctx } = @
  
      ctx.body = await ctx.service.user.login ctx.request.body

    todos: ->
      { ctx } = @

      ctx.body = await ctx.service.user.todos ctx.request.body
           
    oneTodo: ->
      { ctx } = @
      
      ctx.body = await ctx.service.user.oneTodo ctx.request.body
      
    addTodo: ->
      { ctx } = @
      
      ctx.body = await ctx.service.user.addTodo ctx.request.body
      
    updateTodo: ->
      { ctx } = @

      ctx.body = await ctx.service.user.updateTodo ctx.request.body

    deleteTodo: ->
      { ctx } = @

      ctx.body = await ctx.service.user.deleteTodo ctx.request.body
        
  return UsersController