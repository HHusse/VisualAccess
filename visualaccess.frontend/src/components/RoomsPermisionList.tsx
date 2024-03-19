import React, { useEffect, useState } from "react";
import axios from "axios";
import { List, ListItem, ListItemText, Box, Typography } from "@mui/material";
import { TemporaryRoomPermissionInfo } from "../models/TemporaryRoomPermissionInfo";
import { useAuth } from "../hooks/useAuth";

const RoomsPermisionList: React.FC = () => {
  const [temporaryRoomPermissions, setTemporaryRoomPermissions] = useState<
    TemporaryRoomPermissionInfo[]
  >([]);
  const [permanentRoomPermissions, setPermanentRoomPermissions] = useState<
    string[]
  >([]);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  useEffect(() => {
    const fetchTemporaryRoomPermissions = async () => {
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
        setTemporaryRoomPermissions(response.data.temporaryRoomPermissions);
        setPermanentRoomPermissions(response.data.allowedRooms);
      } catch (error) {}
    };

    fetchTemporaryRoomPermissions();
  }, [token]);

  return (
    <Box className="m-2 p-2">
      <Typography
        variant="h4"
        component="h1"
        gutterBottom
        className="text-center"
      >
        Rooms Permission
      </Typography>
      {permanentRoomPermissions.length > 0 && (
        <>
          <Typography
            variant="h4"
            component="h2"
            gutterBottom
            className="text-center"
          >
            Permanent
          </Typography>
          <List className="space-y-2">
            {permanentRoomPermissions.map((permission, index) => (
              <ListItem
                key={index}
                className="bg-gray-100 rounded-md justify-center flex items-center shadow"
              >
                <ListItemText primary={`Room: ${permission}`} />
              </ListItem>
            ))}
          </List>
        </>
      )}
      {temporaryRoomPermissions.length > 0 && (
        <>
          <Typography
            variant="h4"
            component="h2"
            gutterBottom
            className="text-center"
          >
            Temporary
          </Typography>
          <List className="space-y-2">
            {temporaryRoomPermissions.map((permission, index) => (
              <ListItem
                key={index}
                className="bg-gray-100 rounded-md justify-center flex items-center shadow"
              >
                <ListItemText
                  primary={`Room: ${permission.room}`}
                  secondary={`From: ${new Date(
                    permission.from * 1000
                  ).toLocaleString()} - Until: ${new Date(
                    permission.until * 1000
                  ).toLocaleString()}`}
                />
              </ListItem>
            ))}
          </List>
        </>
      )}
    </Box>
  );
};

export default RoomsPermisionList;
