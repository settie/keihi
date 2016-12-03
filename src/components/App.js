import React, { Component } from "react"
import { AppContainer } from "react-hot-loader"

import Root from "./Root"

export default class App extends Component {
  render() {
    return (
      <AppContainer>
        <Root />
      </AppContainer>
    )
  }
}
