import React from "react"
import { connect } from "react-redux"

import "./clusters/new.coffee"
import "./clusters/edit.coffee"
import "./clusters/list.coffee"
import "./clusters/credentials.coffee"
import "./clusters/setup.coffee"
import "../lib/dialogs.coffee"
import "../lib/modal"

import ClusterList from "./clusters/list.coffee"
import NewClusterModal from "./clusters/new.coffee"
import EditClusterModal from "./clusters/edit.coffee"
import SetupInfoModal from "./clusters/setup.coffee"

const modalComponents = {
  NEW_CLUSTER: NewClusterModal,
  EDIT_CLUSTER: EditClusterModal,
  SETUP_INFO: SetupInfoModal,
  // eslint-disable-next-line no-undef
  CONFIRM: ReactConfirmDialog,
  // eslint-disable-next-line no-undef
  INFO: ReactInfoDialog,
  // eslint-disable-next-line no-undef
  ERROR: ReactErrorDialog,
}

// eslint-disable-next-line no-undef
const Modal = ReactModal.Container("modals", modalComponents)

const App = ({ permissions, kubernikusBaseUrl }) => (
  <div>
    <ClusterList kubernikusBaseUrl={kubernikusBaseUrl} />
    <Modal />
  </div>
)

export default connect()(App)
