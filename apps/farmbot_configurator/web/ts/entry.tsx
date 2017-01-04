import * as React from "react";
import { render } from "react-dom";
import { Main } from "./main";
import { state } from "./state";
import { useStrict } from "mobx";

import { wsInit } from "./web_socket";
import { uuid } from "farmbot";
import "../css/main.scss"

// mobx setting for more saftey in the safe things.
useStrict(true);

function onInit() {
  // TODO:
  // Get network SSIDs
  // Set credentials
  // send bot_config_update (timezone, credentials, server, maybe MCU params)
  // submit / try_login or something?

}

/** initialize the websocket connection. */
let ws = wsInit(state, onInit);

// get the element on which we want to render too.
let el = document.querySelector("#app");
if (el) {
  render(<Main state={state} ws={ws} />, el);
} else {
  console.error("could not find element #app");
}