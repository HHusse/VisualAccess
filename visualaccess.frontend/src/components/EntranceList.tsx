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
import { EntranceRecord } from "../models/EntranceRecord";

const EntranceList: React.FC = () => {
  const [records, setRecords] = useState<EntranceRecord[]>([]);
  const [page, setPage] = useState<number>(1);
  const [maxPages, setMaxPages] = useState<number>(0);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  useEffect(() => {
    const fetchRecords = async () => {
      try {
        const response = await axios.get(
          `${process.env.REACT_APP_BACKEND_URL}/api/entrance/record/${page}`,
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        );

        setRecords(response.data.records);
        setMaxPages(response.data.maxPages);
      } catch (error) {}
    };

    fetchRecords();
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
        Entrance Records
      </Typography>
      <TableContainer component={Paper}>
        <Table aria-label="entrance records table">
          <TableHead>
            <TableRow>
              <TableCell align="center">Room</TableCell>
              <TableCell align="center">Username</TableCell>
              <TableCell align="center">Time</TableCell>
              <TableCell align="center">Has Entered</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {records.map((record) => (
              <TableRow key={record.id}>
                <TableCell align="center">{record.roomName}</TableCell>
                <TableCell align="center">{record.username}</TableCell>
                <TableCell align="center">
                  {new Date(record.time * 1000).toLocaleString()}
                </TableCell>
                <TableCell align="center">
                  {record.hasEntered ? "Yes" : "No"}
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

export default EntranceList;
