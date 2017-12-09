import 'shelljs/make'
import dd from 'ddeyes'
import classLocalService from './classLocalService'
import userLocalService from './userLocalService'

########################### class todo ###########################
# local service to leanCloud
target.classLocalService = ->
  classLocalService()

################################ user ############################
# local user service 
target.userLocalService = ->
  userLocalService()