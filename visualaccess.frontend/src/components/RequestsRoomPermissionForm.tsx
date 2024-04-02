import React, { useState } from "react";
import {
  TextField,
  Button,
  Alert,
  Box,
  MenuItem,
  Select,
  FormControl,
  InputLabel,
  Typography,
} from "@mui/material";
import axios from "axios";
import { useAuth } from "../hooks/useAuth";

const RequestsRoomPermissionForm: React.FC = () => {
  const [roomName, setRoomName] = useState<string>("");
  const [type, setType] = useState<string>("");
  const [message, setMessage] = useState<string>("");
  const [errorMessage, setErrorMessage] = useState<string>("");
  const [success, setSuccess] = useState<boolean>(false);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  const handleSubmit = () => {
    const requestBody = { roomName, type, message };
    if (roomName === "" || type === "" || message === "") {
      setErrorMessage("Complete all fields");
      return;
    }
    axios
      .post(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/request/permission/room/register`,
        requestBody,
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
        const message =
          error.response && typeof error.response.data.message === "string"
            ? error.response.data.message
            : "An error occurred. Please try again.";
        setErrorMessage(message);
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
          Request submitted successfully!
        </Alert>
      )}
      <Typography
        variant="h4"
        component="h1"
        gutterBottom
        className="text-center mb-6"
      >
        Create Request Room Permision
      </Typography>
      <TextField
        label="Room Name"
        variant="outlined"
        required
        value={roomName}
        onChange={(e) => setRoomName(e.target.value)}
        sx={{
          "& .MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline":
            { borderColor: "black" },
          "& .MuiInputLabel-root.Mui-focused": { color: "black" },
        }}
      />
      <FormControl
        fullWidth
        required
        sx={{
          "& .MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline":
            { borderColor: "black" },
          "& .MuiInputLabel-root.Mui-focused": { color: "black" },
        }}
      >
        <InputLabel id="type-select-label">Type</InputLabel>
        <Select
          labelId="type-select-label"
          id="type-select"
          value={type}
          label="Type"
          onChange={(e) => setType(e.target.value)}
          sx={{ textAlign: "left" }}
        >
          <MenuItem value="TEMPORARY">Temporary</MenuItem>
          <MenuItem value="PERMANENT">Permanent</MenuItem>
        </Select>
      </FormControl>
      <TextField
        label="Message"
        variant="outlined"
        multiline
        rows={4}
        required
        value={message}
        onChange={(e) => setMessage(e.target.value)}
        sx={{
          "& .MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline":
            { borderColor: "black" },
          "& .MuiInputLabel-root.Mui-focused": { color: "black" },
        }}
      />
      <Button
        variant="contained"
        onClick={handleSubmit}
        className="mt-4"
        sx={{ bgcolor: "black", "&:hover": { bgcolor: "black" } }}
      >
        Submit Request
      </Button>
    </Box>
  );
};

export default RequestsRoomPermissionForm;
