import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import App from "./App";
import LoginPage from "./pages/LoginPage";
import reportWebVitals from "./reportWebVitals";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import PrivateRoute from "./components/PrivateRoute";
import "./styles/tailwind.css";

const root = ReactDOM.createRoot(
  document.getElementById("root") as HTMLElement
);
root.render(
  <Router>
    <Routes>
      <Route
        path="/"
        element={<PrivateRoute element={<App />} requiredRole="ANY" />}
      />
      <Route path="/login" element={<LoginPage />} />
    </Routes>
  </Router>
);

reportWebVitals();
