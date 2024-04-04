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
  Table,
  TableContainer,
  TableHead,
  TableCell,
  TableRow,
  TableBody,
  Paper,
  List,
  ListItem,
  ListItemText,
} from "@mui/material";
import { AccountInfo } from "../models/AccountInfo";
import { useAuth } from "../hooks/useAuth";
import SearchTwoToneIcon from "@mui/icons-material/SearchTwoTone";

const AccountSearcher: React.FC = () => {
  const [username, setUsername] = useState("");
  const [account, setAccount] = useState<AccountInfo | null>(null);
  const [errorMessage, setErrorMessage] = useState<string>();
  const [roomName, setRoomName] = useState<string>("");
  const [permisionErrorMessage, setPermisionErrorMessage] = useState<string>();
  const [permisionSuccess, setPermisionSuccess] = useState<boolean>(false);

  const [tempRoomName, setTempRoomName] = useState<string>("");
  const [tempDays, setTempDays] = useState<number | null>(null);
  const [tempPermisionErrorMessage, setTempPermisionErrorMessage] =
    useState<string>();
  const [tempPermisionSuccess, setTempPermisionSuccess] =
    useState<boolean>(false);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  const handleSearch = async () => {
    setPermisionSuccess(false);
    setPermisionErrorMessage("");
    setErrorMessage("");
    setRoomName("");
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

  const handleGrantPermission = async (username: string, roomName: string) => {
    try {
      await axios.delete(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/account/room/permission`,
        {
          data: { username, roomName },
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
        }
      );
      setAccount((prev: AccountInfo | null) => {
        if (prev === null) {
          return null;
        }
        return {
          ...prev,
          allowedRooms: prev.allowedRooms.filter((r) => r !== roomName),
        };
      });
    } catch (error) {}
  };

  const handleGrantTemporaryPermission = async (
    username: string,
    roomName: string
  ) => {
    try {
      await axios.delete(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/account/room/temporary/permission`,
        {
          data: { username, roomName },
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
        }
      );
      setAccount((prev: AccountInfo | null) => {
        if (prev === null) {
          return null;
        }
        return {
          ...prev,
          temporaryRoomPermissions: prev.temporaryRoomPermissions.filter(
            (permission) => permission.room !== roomName
          ),
        };
      });
    } catch (error) {}
  };

  const handlePermissionCreation = () => {
    if (account?.username !== "" && roomName !== "") {
      axios
        .post(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/account/room/permission`,
          {
            username: account?.username, // Add null check for 'account'
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
          setPermisionErrorMessage("");
          setPermisionSuccess(true);
          setAccount((prevAccount) => {
            if (prevAccount) {
              return {
                ...prevAccount,
                allowedRooms: [...prevAccount.allowedRooms, roomName],
              };
            }
            return null;
          });
        })
        .catch((error) => {
          setPermisionSuccess(false);
          setPermisionErrorMessage(
            error.response?.data?.message || "An error occurred"
          );
        });
    } else {
      setPermisionSuccess(false);
      setPermisionErrorMessage("Room name cannot be empty");
    }
  };

  const handleTemporaryPermissionCreation = () => {
    if (account?.username !== "" && tempRoomName !== "") {
      axios
        .post(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/account/room/temporary/permission`,
          {
            username: account?.username,
            roomName: tempRoomName,
            days: tempDays === null ? 0 : tempDays,
          },
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        )
        .then(() => {
          setTempPermisionErrorMessage("");
          setTempPermisionSuccess(true);
          handleSearch();
        })
        .catch((error) => {
          setTempPermisionSuccess(false);
          setTempPermisionErrorMessage(
            error.response?.data?.message || "An error occurred"
          );
        });
    } else {
      setTempPermisionSuccess(false);
      setTempPermisionErrorMessage("Room name cannot be empty");
    }
  };

  const handleEnterPress = (e: any) => {
    if (e.key === "Enter") {
      console.log("Enter key was pressed");
      handleSearch();
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
      <Box className="flex items-center justify-center gap-1" sx={{ mb: 4 }}>
        <TextField
          label="Username"
          variant="outlined"
          value={username}
          onChange={(e) => setUsername(e.target.value)}
          onKeyDown={handleEnterPress}
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
        <Alert
          severity="warning"
          className="w-full"
          onClick={() => setErrorMessage("")}
        >
          {errorMessage}
        </Alert>
      )}
      {account && (
        <Card
          elevation={3}
          sx={{
            bgcolor: "background.paper",
            borderRadius: "8px",
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

            {account.allowedRooms.length > 0 && (
              <>
                <Typography
                  variant="h5"
                  component="h5"
                  gutterBottom
                  className="text-center"
                  sx={{ mt: 3 }}
                >
                  Permanent Room Permissions
                </Typography>
                <TableContainer component={Paper} elevation={3}>
                  <Table aria-label="allowed rooms table">
                    <TableHead>
                      <TableRow>
                        <TableCell align="center">Room Name</TableCell>
                        <TableCell align="center">Action</TableCell>
                      </TableRow>
                    </TableHead>
                    <TableBody>
                      {account.allowedRooms.map((roomName) => (
                        <TableRow key={roomName}>
                          <TableCell align="center">{roomName}</TableCell>
                          <TableCell align="center">
                            <Button
                              onClick={() =>
                                handleGrantPermission(
                                  account.username,
                                  roomName
                                )
                              }
                              sx={{
                                color: "red",
                                "&:hover": {
                                  bgcolor: "#ffebee",
                                  color: "darkred",
                                },
                              }}
                            >
                              Grant Permission
                            </Button>
                          </TableCell>
                        </TableRow>
                      ))}
                    </TableBody>
                  </Table>
                </TableContainer>
              </>
            )}

            {account.temporaryRoomPermissions.length > 0 && (
              <>
                <Typography
                  variant="h5"
                  component="h5"
                  gutterBottom
                  className="text-center"
                  sx={{ mt: 3 }}
                >
                  Temporary Room Permissions
                </Typography>
                <List className="space-y-2">
                  {account.temporaryRoomPermissions.map((permission, index) => (
                    <ListItem
                      key={index}
                      sx={{
                        backgroundColor: "background.paper",
                        borderRadius: "4px",
                        justifyContent: "space-between", // Adjusted for space between text and button
                        display: "flex",
                        alignItems: "center",
                        boxShadow: 3,
                      }}
                    >
                      <ListItemText
                        primary={`Room: ${permission.room}`}
                        secondary={`From: ${new Date(
                          permission.from * 1000
                        ).toLocaleString()} - Until: ${new Date(
                          permission.until * 1000
                        ).toLocaleString()}`}
                      />
                      <Button
                        onClick={() =>
                          handleGrantTemporaryPermission(
                            account.username,
                            permission.room
                          )
                        }
                        sx={{
                          color: "red",
                          "&:hover": {
                            bgcolor: "#ffebee",
                            color: "darkred",
                          },
                        }}
                      >
                        Grant Permission
                      </Button>
                    </ListItem>
                  ))}
                </List>
              </>
            )}

            <Typography
              variant="h5"
              component="h5"
              gutterBottom
              className="text-center"
              sx={{ mt: 3 }}
            >
              Create Room Permission
            </Typography>
            <Box className="flex flex-col space-y-4">
              {permisionErrorMessage && (
                <Alert
                  severity="error"
                  className="w-full mb-2"
                  onClick={() => setPermisionErrorMessage("")}
                >
                  {permisionErrorMessage}
                </Alert>
              )}
              {permisionSuccess && (
                <Alert
                  severity="success"
                  className="w-full mb-2"
                  onClick={() => setPermisionSuccess(false)}
                >
                  Permission created successfully
                </Alert>
              )}
              <TextField
                label="Room Name"
                variant="outlined"
                required
                value={roomName}
                onChange={(e) => setRoomName(e.target.value)}
                sx={{
                  backgroundColor: "background.paper",
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
            <Typography
              variant="h5"
              component="h5"
              gutterBottom
              className="text-center"
              sx={{ mt: 3 }}
            >
              Create Temporary Room Permission
            </Typography>
            <Box className="flex flex-col space-y-4">
              {tempPermisionErrorMessage && (
                <Alert
                  severity="error"
                  className="w-full mb-2"
                  onClick={() => setTempPermisionErrorMessage("")}
                >
                  {tempPermisionErrorMessage}
                </Alert>
              )}
              {tempPermisionSuccess && (
                <Alert
                  severity="success"
                  className="w-full mb-2"
                  onClick={() => setTempPermisionSuccess(false)}
                >
                  Temporary permission created successfully
                </Alert>
              )}
              <TextField
                label="Room Name"
                variant="outlined"
                required
                value={tempRoomName}
                onChange={(e) => setTempRoomName(e.target.value)}
                sx={{
                  backgroundColor: "background.paper",
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
                label="Days"
                variant="outlined"
                required
                type="number"
                value={tempDays}
                onChange={(e) =>
                  setTempDays(
                    e.target.value === "" ? null : Number(e.target.value)
                  )
                }
                sx={{
                  backgroundColor: "background.paper",
                  "& .MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline":
                    {
                      borderColor: "black",
                    },
                  "& .MuiInputLabel-root.Mui-focused": {
                    color: "black",
                  },
                  "& input[type='number']": {
                    "-moz-appearance": "textfield",
                    "&::-webkit-outer-spin-button": {
                      "-webkit-appearance": "none",
                      margin: 0,
                    },
                    "&::-webkit-inner-spin-button": {
                      "-webkit-appearance": "none",
                      margin: 0,
                    },
                  },
                }}
              />
              <Button
                variant="contained"
                onClick={handleTemporaryPermissionCreation}
                className="mt-4"
                sx={{
                  bgcolor: "black",
                  "&:hover": { bgcolor: "black" },
                }}
              >
                Create Temporary Permission
              </Button>
            </Box>
          </CardContent>
        </Card>
      )}
    </Box>
  );
};

export default AccountSearcher;
