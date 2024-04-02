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
import RoomsListHR from "../components/RoomListHR";

const AdminDashboard = () => {
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
      <div className="w-full p-4 mb-4">
        <div className="flex flex-row justify-center items-center flex-wrap mt-5">
          <div className="flex-1 p-4 text-center">
            <AccountsList />
          </div>
          <div className="flex-1 p-4 text-center">
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
          sx={{ mt: 10, ontWeight: "bold" }}
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
          sx={{ mt: 10, ontWeight: "bold" }}
        >
          Settings
        </Typography>
        <PasswordResetForm />
      </div>
    </>
  );
};

export default AdminDashboard;
