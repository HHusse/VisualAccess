import React from "react";
import Navbar from "../components/Navbar";
import AccountInfoCard from "../components/AccountInfoCard";
import Notifications from "../components/Notifications";
import RequestsRoomPermisionForm from "../components/RequestsRoomPermissionForm";
import PasswordResetForm from "../components/PasswordResetForm";
import { Typography } from "@mui/material";

const UserDashboard = () => {
  return (
    <>
      <Navbar />
      <div className="flex flex-row justify-center items-stretch flex-wrap mt-10">
        <div className="flex-1 p-4 text-center">
          <AccountInfoCard />
        </div>
        <div className="flex-1 p-4 text-center">
          <Notifications />
        </div>
      </div>
      <div className="w-full p-4">
        <RequestsRoomPermisionForm />
      </div>
      <div className="w-full p-4">
        <Typography
          variant="h4"
          component="h1"
          className="text-center"
          sx={{ mt: 10, ontWeight: "bold" }}
        >
          Settings
        </Typography>
        <PasswordResetForm />
      </div>
    </>
  );
};

export default UserDashboard;
