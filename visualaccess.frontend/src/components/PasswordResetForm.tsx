import React, { useState } from "react";
import TextField from "@mui/material/TextField";
import Button from "@mui/material/Button";
import axios from "axios";
import { Alert, Box, Typography } from "@mui/material";
import { useAuth } from "../hooks/useAuth";

const PasswordResetForm: React.FC = () => {
  const [oldPassword, setOldPassword] = useState<string>("");
  const [newPassword, setNewPassword] = useState<string>("");
  const [confirmedPassword, setConfirmedPassword] = useState<string>("");
  const [errorMessage, setErrorMessage] = useState<string>();
  const [success, setSuccess] = useState<boolean>(false);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  const handlePasswordReset = () => {
    if (newPassword !== confirmedPassword) {
      setSuccess(false);
      setErrorMessage("New password and confirmed password do not match");
      return;
    }

    axios
      .patch(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/account/password`, // Adjusted to the correct endpoint
        {
          oldPassword,
          newPassword,
          confirmedPassword,
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
        setSuccess(true);
      })
      .catch((error) => {
        setSuccess(false);
        setErrorMessage(error.response.data.message);
      });
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
          Password reset successfully
        </Alert>
      )}
      <Typography
        variant="h4"
        component="h1"
        gutterBottom
        className="text-center mb-6"
      >
        Reset Password
      </Typography>
      <TextField
        label="Old Password"
        type="password"
        variant="outlined"
        value={oldPassword}
        onChange={(e) => setOldPassword(e.target.value)}
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
        label="New Password"
        type="password"
        variant="outlined"
        value={newPassword}
        onChange={(e) => setNewPassword(e.target.value)}
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
        label="Confirm New Password"
        type="password"
        variant="outlined"
        value={confirmedPassword}
        onChange={(e) => setConfirmedPassword(e.target.value)}
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
        onClick={handlePasswordReset}
        className="mt-4"
        sx={{
          bgcolor: "black",
          "&:hover": { bgcolor: "black" },
        }}
      >
        Reset Password
      </Button>
    </Box>
  );
};

export default PasswordResetForm;
