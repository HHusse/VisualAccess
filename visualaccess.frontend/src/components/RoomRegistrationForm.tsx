import React, { useState } from "react";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import axios from "axios";
import { Alert, Box } from "@mui/material";
import { useAuth } from "../hooks/useAuth";

const RoomRegistrationForm: React.FC = () => {
  const [name, setName] = useState<string>("");
  const [password, setPassword] = useState<string>("");
  const [errorMessage, setErrorMessage] = useState<string>();
  const [succed, setSucced] = useState<boolean>(false);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  const handleRegistration = () => {
    if (name !== "" && password !== "") {
      axios
        .post(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/room/register`,
          {
            name,
            password,
          },
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        )
        .then((response) => {
          setErrorMessage("");
          setSucced(true);
        })
        .catch((error) => {
          setSucced(false);
          setErrorMessage(error.response.data.message);
        });
    } else {
      setSucced(false);
      setErrorMessage("Name and password cannot be empty");
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
      {succed && (
        <Alert
          severity="success"
          className="w-full mb-2"
          onClick={() => setSucced(false)}
        >
          Camera registered successfully
        </Alert>
      )}
      <TextField
        label="Room Name"
        variant="outlined"
        value={name}
        onChange={(e) => setName(e.target.value)}
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
        label="Password"
        type="password"
        variant="outlined"
        value={password}
        onChange={(e) => setPassword(e.target.value)}
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
        onClick={handleRegistration}
        className="mt-4"
        sx={{
          bgcolor: "black",
          "&:hover": { bgcolor: "black" },
        }}
      >
        Register Camera
      </Button>
    </Box>
  );
};

export default RoomRegistrationForm;
