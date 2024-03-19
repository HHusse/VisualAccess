import React, { useState } from "react";
import { TextField, Button, Alert, Box } from "@mui/material";
import axios from "axios";
import { useAuth } from "../hooks/useAuth";

const FaceRegistrationForm: React.FC = () => {
  const [username, setUsername] = useState<string>("");
  const [selectedFile, setSelectedFile] = useState<File | null>(null);
  const [errorMessage, setErrorMessage] = useState<string | null>(null);
  const [success, setSuccess] = useState<boolean>(false);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  const handleFileChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    if (event.target.files && event.target.files[0]) {
      setSelectedFile(event.target.files[0]);
    }
  };

  const handleSubmit = async () => {
    if (!selectedFile || !username) {
      setErrorMessage("Username and face image are required.");
      return;
    }

    const formData = new FormData();
    formData.append("username", username);
    formData.append("faceimg", selectedFile);

    try {
      await axios.post(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/account/register/face`,
        formData,
        {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "multipart/form-data",
          },
        }
      );
      setSuccess(true);
      setErrorMessage(null);
    } catch (error: any) {
      setSuccess(false);
      setErrorMessage(error.response.data.message);
    }
  };

  return (
    <Box className="flex flex-col space-y-4 p-4">
      {errorMessage && (
        <Alert
          severity="error"
          className="w-full mb-2"
          onClick={() => setErrorMessage(null)}
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
          Face registered successfully
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
      <input
        type="file"
        accept=".jpg, .jpeg, .png"
        className="file:mr-4 file:py-2 file:px-4 file:rounded file:border-0 file:text-sm file:font-semibold file:bg-black file:text-white hover:file:bg-opacity-90"
        onChange={handleFileChange}
      />
      <Button
        variant="contained"
        onClick={handleSubmit}
        className="mt-4 !bg-black hover:!bg-opacity-90"
      >
        Register Face
      </Button>
    </Box>
  );
};

export default FaceRegistrationForm;
