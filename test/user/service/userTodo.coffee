import dd from 'ddeyes'
import { services as getUserServ } from 'user-todo-redux/dist/bundle'
userServ = getUserServ()

config = 
  headers:
    'Content-Type': 'application/json'
    'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
    'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
  uri: "https://xy1g1vfw.api.lncld.net/1.1"

userTodo = ->
  data = await userServ.create {
    headers: config.headers
    uri: config.uri
    data:
      username: '何文涛'
      password: '123456'
  }
  data
  dd data

  data_fetch = await userServ.fetch {
    headers: config.headers
    uri: config.uri
    objectId: data.objectId
  }
  dd data_fetch

  data_patch = await userServ.patch {
    headers: 
      'Content-Type': 'application/json'
      'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
      'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      'X-LC-Session': "#{data.sessionToken}"
    uri: config.uri
    objectId: data.objectId
    data:
      username: '陈欢'
      password: '123456'
  }
  data_patch
  dd data_patch

  data_remove = await userServ.remove {
    headers:
      'Content-Type': 'application/json'
      'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
      'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
      'X-LC-Session': "#{data_patch.sessionToken}"
    uri: config.uri
    objectId: data_patch.objectId
  }
  dd data_remove

export {
  userTodo
}
