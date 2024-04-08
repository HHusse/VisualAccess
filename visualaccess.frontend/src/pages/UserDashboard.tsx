import React, { useEffect } from "react";
import Navbar from "../components/Navbar";
import AccountInfoCard from "../components/AccountInfoCard";
import Notifications from "../components/Notifications";
import RequestsRoomPermisionForm from "../components/RequestsRoomPermissionForm";
import PasswordResetForm from "../components/PasswordResetForm";
import { Typography } from "@mui/material";
import withRefresh from "../hoc/withRefresh";

const UserDashboard = () => {
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  const AccountInfoCardWithRefresh = withRefresh(AccountInfoCard);
  const NotificationsWithRefresh = withRefresh(Notifications);

  return (
    <>
      <div className="fixed top-0 w-full z-50">
        <Navbar />
      </div>
      <div className="p-3 md:p-20 flex flex-col min-h-screen">
        <div className="flex flex-wrap justify-center items-stretch mt-10 pt-5">
          <div className="p-2 w-full sm:w-1/2 md:flex-1 text-center">
            <AccountInfoCardWithRefresh />
          </div>
          <div className="p-2 w-full sm:w-1/2 md:flex-1 text-center">
            <NotificationsWithRefresh />
          </div>
        </div>
        <div className="w-full p-2 md:p-4">
          <RequestsRoomPermisionForm />
        </div>
        <div className="w-full p-2 md:p-4">
          <Typography
            variant="h4"
            component="h1"
            className="text-center"
            sx={{ mt: 10, fontWeight: "bold" }}
          >
            Settings
          </Typography>
          <PasswordResetForm />
        </div>
      </div>
    </>
  );
};

export default UserDashboard;
