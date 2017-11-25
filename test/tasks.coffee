import 'shelljs/make'
import dd from 'ddeyes'
import { 
  LC_service
  local_service
  redux_test
} from 'class-todo-redux/dist/bundle'

#### class todo ####
# leanCloud service
target.LC_service = ->
  LC_service()

# local service to leanCloud
target.local_service = ->
  local_service()

#### user ####


# redux test
target.redux_test = ->
  redux_test.staticFuc()
  redux_test.reducersFuc()
  
  promiseFuc = ->
    new Promise (resolve, reject) ->
      redux_test.createFuc(resolve, reject)
    .then (data) ->
      await redux_test.sellp 2000
      redux_test.fetchFuc data

      await redux_test.sellp 2000
      redux_test.patchFuc data

      await redux_test.sellp 2000
      redux_test.reloadFuc()

      await redux_test.sellp 2000
      redux_test.removeFuc data
      
  promiseFuc()