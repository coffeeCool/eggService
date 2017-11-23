export default (app) ->

  class ClassesController extends app.Controller
  
    constructor: (ctx) ->
      super ctx
      @

    createClass: ->
      { ctx } = @
      
      ctx.body = await ctx.service.class.createClass ctx.request.body

    getClassOneTodo: ->
      { ctx } = @
      
      ctx.body = await ctx.service.class.getClassOneTodo ctx.request.body
      
      
    updateClassTodo: ->
      { ctx } = @
      
      ctx.body = await ctx.service.class.updateClassTodo ctx.request.body

    deleteClassTodo: ->
      { ctx } = @

      ctx.body = await ctx.service.class.deleteClassTodo ctx.request.body
        

  return ClassesController