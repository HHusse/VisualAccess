import { useEffect } from "react";
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
import withRefresh from "../hoc/withRefresh";

const HRDashboard = () => {
  useEffect(() => {
    window.scrollTo(0, 0);
  }, []);

  const AccountInfoCardWithRefresh = withRefresh(AccountInfoCard);
  const NotificationsWithRefresh = withRefresh(Notifications);
  const AccountsListWithRefresh = withRefresh(AccountsList);
  const RoomsListHRWithRefresh = withRefresh(RoomsListHR);
  const EntranceListWithRefresh = withRefresh(EntranceList);
  const RequestsRoomPermisionRoomListWithRefresh = withRefresh(
    RequestsRoomPermisionRoomList
  );

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
        <div className="w-full p-2 md:p-4 mb-4">
          <div className="flex flex-wrap justify-center items-center mt-5">
            <div className="p-2 w-full md:w-1/2 lg:flex-1 text-center">
              <AccountsListWithRefresh />
            </div>
            <div className="p-2 w-full md:w-1/2 lg:flex-1 text-center">
              <AccountSearcher />
            </div>
          </div>
          <div className="mt-10">
            <RoomsListHRWithRefresh />
          </div>
          <div className="mt-10">
            <EntranceListWithRefresh />
          </div>
          <div className="mt-10">
            <RequestsRoomPermisionRoomListWithRefresh />
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
      </div>
    </>
  );
};

export default HRDashboard;
