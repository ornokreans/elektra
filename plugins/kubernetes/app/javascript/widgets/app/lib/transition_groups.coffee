ReactCSSTransitionGroup = React.createFactory React.addons.CSSTransitionGroup
import React from "react"

@ReactTransitionGroups = {}

Fade = ({children}) ->
  ReactCSSTransitionGroup
    transitionName: "css-transition-fade",
    transitionEnterTimeout: 500,
    transitionLeaveTimeout: 300,
    children

@ReactTransitionGroups.Fade = React.createFactory Fade
