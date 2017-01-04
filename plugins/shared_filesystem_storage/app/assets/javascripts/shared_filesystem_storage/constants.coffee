((app) ->
  ########## TABS ##########
  app.SELECT_TAB = 'SELECT_TAB'

  ########## SHARES #########
  app.REQUEST_SHARES                  = 'REQUEST_SHARES'
  app.RECEIVE_SHARES                  = 'RECEIVE_SHARES'
  app.REQUEST_SHARE                   = 'REQUEST_SHARE'
  app.REQUEST_SHARE_FAILURE           = 'REQUEST_SHARE_FAILURE'
  app.REQUEST_SHARES_FAILURE          = 'REQUEST_SHARES_FAILURE'
  app.RECEIVE_SHARE                   = 'RECEIVE_SHARE'
  app.REQUEST_DELETE_SHARE            = 'REQUEST_DELETE_SHARE'
  app.DELETE_SHARE_FAILURE            = 'DELETE_SHARE_FAILURE'
  app.DELETE_SHARE_SUCCESS            = 'DELETE_SHARE_SUCCESS'
  app.REQUEST_SHARE_EXPORT_LOCATIONS  = 'REQUEST_SHARE_EXPORT_LOCATIONS'
  app.RECEIVE_SHARE_EXPORT_LOCATIONS  = 'RECEIVE_SHARE_EXPORT_LOCATIONS'
  # SHARE FORM
  app.RESET_SHARE_FORM                = 'RESET_SHARE_FORM'
  app.PREPARE_SHARE_FORM              = 'PREPARE_SHARE_FORM'
  app.UPDATE_SHARE_FORM               = 'UPDATE_SHARE_FORM'
  app.SUBMIT_SHARE_FORM               = 'SUBMIT_SHARE_FORM'
  app.SHARE_FORM_FAILURE              = 'SHARE_FORM_FAILURE'

  # SHARE RULES
  app.REQUEST_SHARE_RULES             = 'REQUEST_SHARE_RULES'
  app.RECEIVE_SHARE_RULES             = 'RECEIVE_SHARE_RULES'
  app.RECEIVE_SHARE_RULE              = 'RECEIVE_SHARE_RULE'
  app.REQUEST_DELETE_SHARE_RULE       = 'REQUEST_DELETE_SHARE_RULE'
  app.DELETE_SHARE_RULE_FAILURE       = 'DELETE_SHARE_RULE_FAILURE'
  app.DELETE_SHARE_RULE_SUCCESS       = 'DELETE_SHARE_RULE_SUCCESS'
  # SHARE RULE FORM
  app.RESET_SHARE_RULE_FORM           = 'RESET_SHARE_RULE_FORM'
  app.UPDATE_SHARE_RULE_FORM          = 'UPDATE_SHARE_RULE_FORM'
  app.SUBMIT_SHARE_RULE_FORM          = 'SUBMIT_SHARE_RULE_FORM'
  app.PREPARE_SHARE_RULE_FORM         = 'PREPARE_SHARE_RULE_FORM'
  app.SHOW_SHARE_RULE_FORM            = 'SHOW_SHARE_RULE_FORM'
  app.HIDE_SHARE_RULE_FORM            = 'HIDE_SHARE_RULE_FORM'

  ########## SNAPSHOTS #########
  app.REQUEST_SNAPSHOTS                  = 'REQUEST_SNAPSHOTS'
  app.RECEIVE_SNAPSHOTS                  = 'RECEIVE_SNAPSHOTS'
  app.REQUEST_SNAPSHOT                   = 'REQUEST_SNAPSHOT'
  app.REQUEST_SNAPSHOT_FAILURE           = 'REQUEST_SNAPSHOT_FAILURE'
  app.REQUEST_SNAPSHOTS_FAILURE          = 'REQUEST_SNAPSHOTS_FAILURE'
  app.RECEIVE_SNAPSHOT                   = 'RECEIVE_SNAPSHOT'
  app.REQUEST_DELETE_SNAPSHOT            = 'REQUEST_DELETE_SNAPSHOT'
  app.DELETE_SNAPSHOT_FAILURE            = 'DELETE_SNAPSHOT_FAILURE'
  app.DELETE_SNAPSHOT_SUCCESS            = 'DELETE_SNAPSHOT_SUCCESS'
  # SNAPSHOT FORM
  app.RESET_SNAPSHOT_FORM                = 'RESET_SNAPSHOT_FORM'
  app.PREPARE_SNAPSHOT_FORM              = 'PREPARE_SNAPSHOT_FORM'
  app.UPDATE_SNAPSHOT_FORM               = 'UPDATE_SNAPSHOT_FORM'
  app.SUBMIT_SNAPSHOT_FORM               = 'SUBMIT_SNAPSHOT_FORM'
  app.SNAPSHOT_FORM_FAILURE              = 'SNAPSHOT_FORM_FAILURE'

  ############ NETWORKS ################
  app.REQUEST_NETWORKS                  = 'REQUEST_NETWORKS'
  app.RECEIVE_NETWORKS                  = 'RECEIVE_NETWORKS'
  app.REQUEST_NETWORKS_FAILURE          = 'REQUEST_NETWORKS_FAILURE'
  ############ SUBNETS #################
  app.RECEIVE_SUBNETS                   = 'RECEIVE_SUBNETS'
  app.REQUEST_SUBNETS                   = 'REQUEST_SUBNETS'
  app.REQUEST_SUBNETS_FAILURE           = 'REQUEST_SUBNETS_FAILURE'

  ########## SHARE_NETWORKS #########
  app.REQUEST_SHARE_NETWORKS                  = 'REQUEST_SHARE_NETWORKS'
  app.RECEIVE_SHARE_NETWORKS                  = 'RECEIVE_SHARE_NETWORKS'
  app.REQUEST_SHARE_NETWORK                   = 'REQUEST_SHARE_NETWORK'
  app.REQUEST_SHARE_NETWORK_FAILURE           = 'REQUEST_SHARE_NETWORK_FAILURE'
  app.REQUEST_SHARE_NETWORKS_FAILURE          = 'REQUEST_SHARE_NETWORKS_FAILURE'
  app.RECEIVE_SHARE_NETWORK                   = 'RECEIVE_SHARE_NETWORK'
  app.REQUEST_DELETE_SHARE_NETWORK            = 'REQUEST_DELETE_SHARE_NETWORK'
  app.DELETE_SHARE_NETWORK_FAILURE            = 'DELETE_SHARE_NETWORK_FAILURE'
  app.DELETE_SHARE_NETWORK_SUCCESS            = 'DELETE_SHARE_NETWORK_SUCCESS'
  # SHARE_NETWORK FORM
  app.RESET_SHARE_NETWORK_FORM                = 'RESET_SHARE_NETWORK_FORM'
  app.PREPARE_SHARE_NETWORK_FORM              = 'PREPARE_SHARE_NETWORK_FORM'
  app.UPDATE_SHARE_NETWORK_FORM               = 'UPDATE_SHARE_NETWORK_FORM'
  app.SUBMIT_SHARE_NETWORK_FORM               = 'SUBMIT_SHARE_NETWORK_FORM'
  app.SHARE_NETWORK_FORM_FAILURE              = 'SHARE_NETWORK_FORM_FAILURE'

  ######### MODALS #########
  app.SHOW_MODAL = 'SHOW_MODAL'
  app.HIDE_MODAL = 'HIDE_MODAL'

  ######### SHARE NETWORKS #########
  app.REQUEST_SHARE_NETWORKS = 'REQUEST_SHARE_NETWORKS'
  app.RECEIVE_SHARE_NETWORKS = 'RECEIVE_SHARE_NETWORKS'

)(shared_filesystem_storage)
