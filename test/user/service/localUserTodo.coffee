import dd from 'ddeyes'
import toolFuc from '../../../src/app/extend/helper'

localUserLogin = (data) ->
  toolFuc(
    'POST'
    data.headers
    "#{data.uri}/login"
    data.data
  )

localCreateUser = (data)->
  toolFuc(
    'POST'
    data.headers
    "#{data.uri}/users"
    data.data
  )

localGetUser = (data)->
  toolFuc(
    'GET'
    data.headers
    "#{data.uri}/users/#{data.objectId}"
    data.data
  )

localUpdUser = (data)->
  toolFuc(
    'PUT'
    data.headers
    "#{data.uri}/users/#{data.objectId}"
    data.data
  )

localDelUser = (data)->
  toolFuc(
    'DELETE'
    data.headers
    "#{data.uri}/users/#{data.objectId}"
    data.data
  )

export {
  localUserLogin
  localCreateUser
  localGetUser
  localUpdUser
  localDelUser
}