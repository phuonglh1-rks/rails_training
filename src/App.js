// in src/App.js
import * as React from "react";
import { Admin, Resource, ListGuesser } from "react-admin";
import jsonServerProvider from "ra-data-json-server";

const dataProvider = jsonServerProvider("http://localhost:3000/api/v1");
const App = () => (
  <Admin dataProvider={dataProvider}>
    <Resource name="articles" list={ListGuesser} />
  </Admin>
);

export default App;
