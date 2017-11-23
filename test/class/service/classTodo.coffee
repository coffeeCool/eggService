import dd from 'ddeyes'
import { services as getClassServ } from 'class-todo-redux/dist/bundle'
classServ = getClassServ()

config =
  headers:
    'Content-Type': 'application/json'
    'X-LC-Id': 'xY1g1VfwXDcyrMLI0UWUjmKe-gzGzoHsz'
    'X-LC-Key': 'rRvdD9oizDgldNbbIpgFPd1X'
  uri: "https://xy1g1vfw.api.lncld.net/1.1/classes"
  className: 'Todos'

classTodo = ->
  data = await classServ.create {
    headers: config.headers
    uri: config.uri
    className: config.className
    data:
      company: '举手帮租有限公司'
      main: '租房'
      location: '武汉'
  }
  data
  dd data

  data_fetch = await classServ.fetch {
    headers: config.headers
    uri: config.uri
    className: config.className
    objectId: data.objectId
  }
  dd data_fetch

  data_patch = await classServ.patch {
    headers: config.headers
    uri: config.uri
    className: config.className
    objectId: data.objectId
    data:
      company: '阿里巴巴有限公司'
      main: '租房大佬'
      location: '武汉'
  }
  data_patch
  dd data_patch

  data_remove = await classServ.remove {
    headers: config.headers
    uri: config.uri
    className: config.className
    objectId: data_patch.objectId
  }
  dd data_remove

export {
  classTodo
}