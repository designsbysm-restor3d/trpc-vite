import React from "react";
import ReactDOM from "react-dom/client";

import "./main.css";
// import App from "./App.tsx";
import Context from "./Context.tsx";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <Context />
  </React.StrictMode>
);
