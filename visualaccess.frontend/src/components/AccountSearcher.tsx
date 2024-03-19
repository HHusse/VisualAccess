import React, { useState } from "react";
import axios from "axios";
import {
  Button,
  TextField,
  Card,
  CardContent,
  Typography,
  Box,
  Alert,
} from "@mui/material";
import { AccountInfo } from "../models/AccountInfo";
import { useAuth } from "../hooks/useAuth";
import SearchTwoToneIcon from "@mui/icons-material/SearchTwoTone";

const AccountSearcher: React.FC = () => {
  const [username, setUsername] = useState("");
  const [account, setAccount] = useState<AccountInfo | null>(null);
  const [errorMessage, setErrorMessage] = useState<string>();
  const { getToken } = useAuth();
  const token: string | null = getToken();

  const handleSearch = async () => {
    try {
      const response = await axios.get(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/account`,
        {
          params: {
            username,
          },
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
        }
      );
      setAccount(response.data);
      setErrorMessage("");
    } catch (error) {
      console.error("Failed to fetch account:", error);
      setErrorMessage((error as any).response.data.message);
      setAccount(null);
    }
  };

  return (
    <Box>
      <Typography
        variant="h4"
        component="h1"
        gutterBottom
        className="text-center mb-6"
      >
        Search Account
      </Typography>
      <Box className="flex items-center justify-center mb-2 gap-1">
        <TextField
          label="Username"
          variant="outlined"
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
        <Button
          variant="contained"
          onClick={handleSearch}
          sx={{
            bgcolor: "black",
            "&:hover": { bgcolor: "black" },
          }}
        >
          <SearchTwoToneIcon />
        </Button>
      </Box>
      {errorMessage && (
        <Alert severity="warning" className="w-full">
          {errorMessage}
        </Alert>
      )}
      {account && (
        <Card
          sx={{
            bgcolor: "rgb(243 244 246)",
            borderRadius: "8px",
            boxShadow:
              "0 1px 3px 0 rgb(0 0 0 / 0.1), 0 1px 2px -1px rgb(0 0 0 / 0.1)",
          }}
        >
          <CardContent>
            <Typography>First Name: {account.firstName}</Typography>
            <Typography>Last Name: {account.lastName}</Typography>
            <Typography>Email: {account.email}</Typography>
            <Typography>Address: {account.address}</Typography>
            <Typography>Phone Number: {account.phoneNumber}</Typography>
            <Typography>
              Face Registered: {account.faceID ? "Yes" : "No"}
            </Typography>
            <Typography>Role: {account.role}</Typography>
          </CardContent>
        </Card>
      )}
    </Box>
  );
};

export default AccountSearcher;
