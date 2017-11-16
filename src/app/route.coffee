export default (app) ->
  app.get '/', app.controller.todo.helloTodo