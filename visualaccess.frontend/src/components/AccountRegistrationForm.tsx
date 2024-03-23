import React, { useState } from "react";
import {
  TextField,
  Button,
  Alert,
  Box,
  MenuItem,
  Select,
  InputLabel,
  FormControl,
} from "@mui/material";
import axios from "axios";
import { useAuth } from "../hooks/useAuth";

const AccountRegistrationForm: React.FC = () => {
  const [firstName, setFirstName] = useState<string>("");
  const [lastName, setLastName] = useState<string>("");
  const [username, setUsername] = useState<string>("");
  const [email, setEmail] = useState<string>("");
  const [address, setAddress] = useState<string>("");
  const [phoneNumber, setPhoneNumber] = useState<string>("");
  const [role, setRole] = useState<string>("");
  const [errorMessage, setErrorMessage] = useState<string>();
  const [success, setSuccess] = useState<boolean>(false);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  const handleRegistration = () => {
    axios
      .post(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/account/register`,
        {
          firstName,
          lastName,
          username,
          email,
          address,
          phoneNumber,
          role,
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
        if (typeof error.response.data.message === "string") {
          setErrorMessage(error.response.data.message);
        } else {
          setErrorMessage("Complete all fields");
        }
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
          Account registered successfully
        </Alert>
      )}
      <TextField
        label="First Name"
        variant="outlined"
        required
        value={firstName}
        onChange={(e) => setFirstName(e.target.value)}
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
        label="Last Name"
        variant="outlined"
        required
        value={lastName}
        onChange={(e) => setLastName(e.target.value)}
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
        label="Email"
        type="email"
        variant="outlined"
        required
        value={email}
        onChange={(e) => setEmail(e.target.value)}
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
        label="Address"
        variant="outlined"
        required
        value={address}
        onChange={(e) => setAddress(e.target.value)}
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
        label="Phone Number"
        variant="outlined"
        required
        value={phoneNumber}
        onChange={(e) => setPhoneNumber(e.target.value)}
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
      <FormControl
        fullWidth
        required
        sx={{
          "& .MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline":
            {
              borderColor: "black",
            },
          "& .MuiInputLabel-root.Mui-focused": {
            color: "black",
          },
        }}
      >
        <InputLabel id="role-select-label">Role</InputLabel>
        <Select
          labelId="role-select-label"
          id="role-select"
          value={role}
          label="Role"
          onChange={(e) => setRole(e.target.value)}
          sx={{
            textAlign: "left",
          }}
          MenuProps={{
            sx: {
              ".MuiMenuItem-root.Mui-selected, .MuiMenuItem-root.Mui-selected:hover":
                {
                  backgroundColor: "rgba(0, 0, 0, 0.1)",
                },
              ".MuiMenuItem-root:hover": {
                backgroundColor: "rgba(0, 0, 0, 0.04)",
              },
            },
          }}
        >
          <MenuItem value="ADMIN">ADMIN</MenuItem>
          <MenuItem value="HR">HR</MenuItem>
          <MenuItem value="PERSON">PERSON</MenuItem>
        </Select>
      </FormControl>
      <Button
        variant="contained"
        onClick={handleRegistration}
        className="mt-4"
        sx={{
          bgcolor: "black",
          "&:hover": { bgcolor: "black" },
        }}
      >
        Register Account
      </Button>
    </Box>
  );
};

export default AccountRegistrationForm;
