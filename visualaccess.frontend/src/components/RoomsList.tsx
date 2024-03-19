import React, { useState, useEffect } from "react";
import axios from "axios";
import {
  Container,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  Pagination,
  Typography,
  Button,
  Alert,
} from "@mui/material";
import { useAuth } from "../hooks/useAuth";

interface RoomInfo {
  roomName: string;
}

const RoomsList: React.FC = () => {
  const [rooms, setRooms] = useState<RoomInfo[]>([]);
  const [page, setPage] = useState(1);
  const [maxPages, setMaxPages] = useState(0);
  const { getToken } = useAuth();
  const token: string | null = getToken();
  const [refreshTrigger, setRefreshTrigger] = useState<number>(0);
  const [errorMessage, setErrorMessage] = useState<string>();

  useEffect(() => {
    const fetchRooms = async () => {
      try {
        const response = await axios.get(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/rooms/${page}`,
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        );

        setRooms(response.data.rooms);
        setMaxPages(response.data.maxPages);
      } catch (error: any) {
        if (error.response && error.response.status === 404) {
          setPage((prev) => prev - 1);
        } else {
          setErrorMessage("Failed to fetch rooms.");
        }
      }
    };

    fetchRooms();
  }, [page, token, refreshTrigger]);

  const handleCloseClick = () => {
    setErrorMessage("");
  };

  const handleDelete = async (roomName: string) => {
    try {
      await axios.delete(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/room`,
        {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
          data: { name: roomName },
        }
      );

      setRefreshTrigger((prev) => prev + 1);
    } catch (error: any) {
      if (error.response && error.response.status === 400) {
        setErrorMessage(error.response.data.message);
      } else {
        setErrorMessage("Failed to delete room.");
      }
    }
  };

  const handlePageChange = (
    event: React.ChangeEvent<unknown>,
    value: number
  ) => {
    setPage(value);
  };

  return (
    <Container>
      <Typography
        variant="h4"
        component="h1"
        gutterBottom
        className="text-center mb-6"
      >
        Rooms List
      </Typography>
      {errorMessage && (
        <Alert
          severity="error"
          className="w-full mb-2"
          onClick={handleCloseClick}
        >
          {errorMessage}
        </Alert>
      )}
      <TableContainer component={Paper}>
        <Table aria-label="rooms table">
          <TableHead>
            <TableRow>
              <TableCell align="center">Room Name</TableCell>
              <TableCell align="center">Actions</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rooms.map((room) => (
              <TableRow key={room.roomName}>
                <TableCell align="center">{room.roomName}</TableCell>
                <TableCell align="center">
                  <Button
                    sx={{
                      color: "red",
                      "&:hover": { bgcolor: "#ffebee", color: "darkred" },
                    }}
                    onClick={() => handleDelete(room.roomName)}
                  >
                    Delete
                  </Button>
                </TableCell>
              </TableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
      <Pagination
        count={maxPages}
        page={page}
        onChange={handlePageChange}
        className="mt-5 flex justify-center"
      />
    </Container>
  );
};

export default RoomsList;
