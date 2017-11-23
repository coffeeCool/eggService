export default (app) ->
  # leancloud class todo
  app.post '/classes', app.controller.class.createClass
  app.get '/classes/:id', app.controller.class.getClassOneTodo  
  app.put '/classes/:id', app.controller.class.updateClassTodo
  app.delete '/classes/:id', app.controller.class.deleteClassTodo

  # leancloud user todo
  app.post '/login', app.controller.user.login
  app.post '/users', app.controller.user.addTodo
  app.get '/users/:id', app.controller.user.oneTodo  
  app.put '/users/:id', app.controller.user.updateTodo
  app.delete '/users/:id', app.controller.user.deleteTodo