import React, { Component } from "react"

import Header from "./Header"

export default class App extends Component {
  render() {
    return (
      <div>
        <Header />
        <section>`{Date.now()}`, hi</section>
      </div>
    )
  }
}
