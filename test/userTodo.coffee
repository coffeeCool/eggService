import dd from 'ddeyes'
import {
  LC_createUser
  LC_userLogin
  LC_getUsers
  LC_getOneUser
  LC_updateUser
  LC_deleteUser
} from 'user-todo'

config = 
  headers:
    'Content-Type': 'application/json'
    'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
    'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
  uri: "https://xy1g1vfw.api.lncld.net/1.1"

userTodo = ->
  data = await LC_createUser
    headers: config.headers
    uri: "#{config.uri}/users"
    data:
      username: '何文涛'
      password: '123456'
      phoneNo: '18671952696'
  data
  dd data

  data_login = await LC_userLogin
    headers: config.headers
    uri: "#{config.uri}/login"
    data:
      username: '何文涛'
      password: '123456'
  dd data_login

  data_getOneUser = await LC_getUsers
    headers: config.headers
    uri: "#{config.uri}/users/#{data.objectId}"
  dd data_getOneUser

  data_getUsers = await LC_getUsers
    headers: config.headers
    uri: "#{config.uri}/users"
  dd data_getUsers

  data_updateUser = await LC_updateUser
    headers: 
      'Content-Type': 'application/json'
      'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
      'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      'X-LC-Session': "#{data.sessionToken}"
    uri: "#{config.uri}/users/#{data.objectId}?fetchWhenSave=true"
    data:
      username: '陈欢'
      password: '123456'
      phoneNo: '110'
  data_updateUser
  dd data_updateUser

  data_deleteUser = await LC_deleteUser
    headers:
      'Content-Type': 'application/json'
      'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
      'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      'X-LC-Session': "#{data_updateUser.sessionToken}"
    uri: "#{config.uri}/users/#{data_updateUser.objectId}"
  dd data_deleteUser

export {
  userTodo
}
