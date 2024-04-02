import React, { useState, useEffect } from "react";
import axios from "axios";
import {
  Card,
  CardContent,
  Typography,
  List,
  ListItem,
  ListItemText,
  Box,
} from "@mui/material";
import { AccountInfo } from "../models/AccountInfo"; // Adjust the import path as necessary
import { useAuth } from "../hooks/useAuth";

const AccountInfoCard: React.FC = () => {
  const [accountInfo, setAccountInfo] = useState<AccountInfo | null>(null);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  useEffect(() => {
    const fetchAccountInfo = async () => {
      try {
        const response = await axios.get(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/account/info`,
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        );
        setAccountInfo(response.data);
      } catch (error) {
        console.error("Failed to fetch account info", error);
      }
    };

    fetchAccountInfo();
  }, [token]);

  if (!accountInfo) return <div>Loading...</div>;

  // Helper function to format the timestamp
  const formatDate = (timestamp: number) => {
    return new Date(timestamp * 1000).toLocaleString();
  };

  return (
    <>
      <Typography variant="h4" sx={{ mb: 1 }}>
        Account Information
      </Typography>
      <Card elevation={0}>
        <CardContent>
          <Typography variant="h5" component="div" sx={{ mb: 1 }}>
            {accountInfo.firstName} {accountInfo.lastName}
          </Typography>
          <Typography color="text.secondary">
            Username: {accountInfo.username}
          </Typography>
          <Typography color="text.secondary">
            Email: {accountInfo.email}
          </Typography>
          <Typography color="text.secondary">
            Address: {accountInfo.address}
          </Typography>
          <Typography color="text.secondary">
            Phone: {accountInfo.phoneNumber}
          </Typography>
          <Typography color="text.secondary">
            Role: {accountInfo.role}
          </Typography>
          <Typography color="text.secondary">
            Face Registered: {accountInfo.faceID ? "Yes" : "No"}
          </Typography>
          <Typography color="text.secondary" sx={{ mt: 3, fontWeight: "bold" }}>
            Allowed Rooms:
          </Typography>
          <Typography color="text.secondary">
            {accountInfo.allowedRooms.join(", ") || "None"}
          </Typography>
          {accountInfo.temporaryRoomPermissions.length > 0 && (
            <>
              <Typography
                color="text.secondary"
                sx={{ mt: 3, textAlign: "center", fontWeight: "bold" }}
              >
                Temporary Room Permissions:
              </Typography>
              <Box display="flex" justifyContent="center">
                <List>
                  {accountInfo.temporaryRoomPermissions.map((perm, index) => (
                    <ListItem
                      key={index}
                      sx={{ justifyContent: "center", mt: -2 }}
                    >
                      <ListItemText
                        primary={`Room: ${perm.room}`}
                        secondary={`From: ${formatDate(
                          perm.from
                        )} Until: ${formatDate(perm.until)}`}
                        primaryTypographyProps={{
                          textAlign: "center",
                          color: "text.secondary",
                        }}
                        secondaryTypographyProps={{
                          textAlign: "center",
                          color: "text.secondary",
                        }}
                      />
                    </ListItem>
                  ))}
                </List>
              </Box>
            </>
          )}
        </CardContent>
      </Card>
    </>
  );
};

export default AccountInfoCard;
