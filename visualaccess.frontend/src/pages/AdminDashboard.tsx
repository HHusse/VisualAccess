import React, { useEffect } from "react";
import Navbar from "../components/Navbar";
import AccountInfoCard from "../components/AccountInfoCard";
import Notifications from "../components/Notifications";
import RequestsRoomPermisionForm from "../components/RequestsRoomPermissionForm";
import PasswordResetForm from "../components/PasswordResetForm";
import { Typography } from "@mui/material";
import AccountsList from "../components/AccountsList";
import AccountSearcher from "../components/AccountSearcher";
import RoomsList from "../components/RoomsList";
import EntranceList from "../components/EntranceList";
import RequestDecisionList from "../components/RequestDecisionList";
import RequestsRoomPermisionRoomList from "../components/RequestsRoomPermissionList";
import AccountRegistrationForm from "../components/AccountRegistrationForm";
import FaceRegistrationForm from "../components/FaceRegistrationForm";
import RoomRegistrationForm from "../components/RoomRegistrationForm";

const AdminDashboard = () => {
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  return (
    <div className="flex flex-col min-h-screen">
      <div className="fixed top-0 w-full z-50">
        <Navbar />
      </div>
      <div className="flex flex-wrap justify-center items-stretch mt-10 pt-20">
        <div className="p-2 w-full sm:w-1/2 md:flex-1 text-center">
          <AccountInfoCard />
        </div>
        <div className="p-2 w-full sm:w-1/2 md:flex-1 text-center">
          <Notifications />
        </div>
      </div>
      <div className="w-full p-2 md:p-4 mb-4">
        <div className="flex flex-wrap justify-center items-center mt-5">
          <div className="p-2 w-full md:w-1/2 lg:flex-1 text-center">
            <AccountsList />
          </div>
          <div className="p-2 w-full md:w-1/2 lg:flex-1 text-center">
            <AccountSearcher />
          </div>
        </div>
        <div className="mt-10">
          <RoomsList />
        </div>
        <div className="mt-10">
          <EntranceList />
        </div>
        <div className="mt-10">
          <RequestsRoomPermisionRoomList />
        </div>
        <div className="mt-10">
          <RequestDecisionList />
        </div>
        <Typography
          variant="h4"
          component="h1"
          className="text-center"
          sx={{ mt: 10, fontWeight: "bold" }}
        >
          Registrations
        </Typography>
        <div>
          <AccountRegistrationForm />
        </div>
        <div className="mt-10">
          <FaceRegistrationForm />
        </div>
        <div className="mt-10">
          <RoomRegistrationForm />
        </div>
        <div className="mt-10">
          <RequestsRoomPermisionForm />
        </div>
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
  );
};

export default AdminDashboard;
