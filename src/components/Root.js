import React, { Component } from "react"

import Header from "./Header"

export default class Root extends Component {
  render() {
    return (
      <div>
        <Header />
        <section>`{Date.now()}`, hi</section>
      </div>
    )
  }
}
