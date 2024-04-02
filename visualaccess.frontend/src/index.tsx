import React from "react";
import ReactDOM from "react-dom/client";
import "./index.css";
import LoginPage from "./pages/LoginPage";
import reportWebVitals from "./reportWebVitals";
import { BrowserRouter as Router, Route, Routes } from "react-router-dom";
import { Navigate } from "react-router-dom";
import PrivateRoute from "./components/PrivateRoute";
import "./styles/tailwind.css";
import UserDashboard from "./pages/UserDashboard";
import AdminDashboard from "./pages/AdminDashboard";
import HRDashboard from "./pages/HRDashboard";

const root = ReactDOM.createRoot(
  document.getElementById("root") as HTMLElement
);
root.render(
  <Router>
    <Routes>
      <Route path="/" element={<Navigate to="/login" />} />
      <Route path="/login" element={<LoginPage />} />
      <Route
        path="/user-dashboard"
        element={
          <PrivateRoute element={<UserDashboard />} requiredRole="PERSON" />
        }
      />
      <Route
        path="/admin-dashboard"
        element={
          <PrivateRoute element={<AdminDashboard />} requiredRole="ADMIN" />
        }
      />
      <Route
        path="/hr-dashboard"
        element={<PrivateRoute element={<HRDashboard />} requiredRole="HR" />}
      />
    </Routes>
  </Router>
);

reportWebVitals();
