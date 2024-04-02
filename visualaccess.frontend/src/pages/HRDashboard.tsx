import React from "react";
import Navbar from "../components/Navbar";
import AccountInfoCard from "../components/AccountInfoCard";
import Notifications from "../components/Notifications";
import RequestsRoomPermisionForm from "../components/RequestsRoomPermissionForm";
import PasswordResetForm from "../components/PasswordResetForm";
import { Typography } from "@mui/material";
import AccountsList from "../components/AccountsList";
import AccountSearcher from "../components/AccountSearcher";
import EntranceList from "../components/EntranceList";
import RequestsRoomPermisionRoomList from "../components/RequestsRoomPermissionList";
import AccountRegistrationForm from "../components/AccountRegistrationForm";
import FaceRegistrationForm from "../components/FaceRegistrationForm";
import RoomsListHR from "../components/RoomsListHR";

const HRDashboard = () => {
  return (
    <>
      <Navbar />
      <div className="flex flex-wrap justify-center items-stretch mt-10">
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
          <RoomsListHR />
        </div>
        <div className="mt-10">
          <EntranceList />
        </div>
        <div className="mt-10">
          <RequestsRoomPermisionRoomList />
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
    </>
  );
};

export default HRDashboard;
