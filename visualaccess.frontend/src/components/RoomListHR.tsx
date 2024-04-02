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
} from "@mui/material";
import { useAuth } from "../hooks/useAuth";

interface RoomInfo {
  roomName: string;
}

const RoomsListHR: React.FC = () => {
  const [rooms, setRooms] = useState<RoomInfo[]>([]);
  const [page, setPage] = useState(1);
  const [maxPages, setMaxPages] = useState(0);
  const { getToken } = useAuth();
  const token: string | null = getToken();

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
      } catch (error: any) {}
    };

    fetchRooms();
  }, [page, token]);

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
      <TableContainer component={Paper}>
        <Table aria-label="rooms table">
          <TableHead>
            <TableRow>
              <TableCell align="center">Room Name</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {rooms.map((room) => (
              <TableRow key={room.roomName}>
                <TableCell align="center">{room.roomName}</TableCell>
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

export default RoomsListHR;
