import React, { useState } from "react";
import { TextField, Button, Alert, Box } from "@mui/material";
import axios from "axios";
import { useAuth } from "../hooks/useAuth";

const RoomPermissionForm: React.FC = () => {
  const [username, setUsername] = useState<string>("");
  const [roomName, setRoomName] = useState<string>("");
  const [errorMessage, setErrorMessage] = useState<string>();
  const [success, setSuccess] = useState<boolean>(false);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  const handlePermissionCreation = () => {
    if (username !== "" && roomName !== "") {
      axios
        .post(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/account/room/permission`,
          {
            username,
            roomName,
          },
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        )
        .then(() => {
          setErrorMessage("");
          setSuccess(true);
        })
        .catch((error) => {
          setSuccess(false);
          setErrorMessage(error.response?.data?.message || "An error occurred");
        });
    } else {
      setSuccess(false);
      setErrorMessage("Username and room name cannot be empty");
    }
  };

  return (
    <Box className="flex flex-col space-y-4 p-4">
      {errorMessage && (
        <Alert
          severity="error"
          className="w-full mb-2"
          onClick={() => setErrorMessage("")}
        >
          {errorMessage}
        </Alert>
      )}
      {success && (
        <Alert
          severity="success"
          className="w-full mb-2"
          onClick={() => setSuccess(false)}
        >
          Permission created successfully
        </Alert>
      )}
      <TextField
        label="Username"
        variant="outlined"
        required
        value={username}
        onChange={(e) => setUsername(e.target.value)}
        sx={{
          "& .MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline":
            {
              borderColor: "black",
            },
          "& .MuiInputLabel-root.Mui-focused": {
            color: "black",
          },
        }}
      />
      <TextField
        label="Room Name"
        variant="outlined"
        required
        value={roomName}
        onChange={(e) => setRoomName(e.target.value)}
        sx={{
          "& .MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline":
            {
              borderColor: "black",
            },
          "& .MuiInputLabel-root.Mui-focused": {
            color: "black",
          },
        }}
      />
      <Button
        variant="contained"
        onClick={handlePermissionCreation}
        className="mt-4"
        sx={{
          bgcolor: "black",
          "&:hover": { bgcolor: "black" },
        }}
      >
        Create Permission
      </Button>
    </Box>
  );
};

export default RoomPermissionForm;
