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
} from "@mui/material";
import { useAuth } from "../hooks/useAuth";
import { RequestsRoomPermissionInfo } from "../models/RequestsRoomPermisionInfo";
import DaysInputDialog from "./DaysInputDialog";

const RequestsRoomPermisionRoomList: React.FC = () => {
  const [requests, setRequests] = useState<RequestsRoomPermissionInfo[]>([]);
  const [isDialogOpen, setIsDialogOpen] = useState<boolean>(false);
  const [tempRequestId, setTempRequestId] = useState<string | null>(null);
  const [page, setPage] = useState(1);
  const [maxPages, setMaxPages] = useState(0);
  const { getToken } = useAuth();
  const token: string | null = getToken();
  const [refreshTrigger, setRefreshTrigger] = useState<number>(0);

  useEffect(() => {
    const fetchRequests = async () => {
      if (page === 0) {
        setRequests([]);
        setMaxPages(0);
        return;
      }

      try {
        const response = await axios.get(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/requests/permission/room/${page}`,
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        );

        setRequests(response.data.requests);
        setMaxPages(response.data.maxPages);
      } catch (error: any) {
        if (error.response.status === 404) {
          setPage((prev) => prev - 1);
        }
      }
    };

    fetchRequests();
  }, [page, token, refreshTrigger]);

  const handlePageChange = (
    event: React.ChangeEvent<unknown>,
    value: number
  ) => {
    setPage(value);
  };

  const openDialogForTemporaryRequest = (requestId: string) => {
    setTempRequestId(requestId);
    setIsDialogOpen(true);
  };

  const handleDialogSubmit = async (days: number) => {
    setIsDialogOpen(false);
    if (tempRequestId) {
      try {
        await axios.post(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/request/permission/room`,
          { requestId: tempRequestId, days },
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        );
        setRefreshTrigger((prev) => prev + 1);
      } catch (error) {}
    }
  };

  const handleAccept = async (requestId: string, requestType: string) => {
    console.log(requestId, requestType);
    if (requestType === "TEMPORARY") {
      openDialogForTemporaryRequest(requestId);
    } else {
      try {
        await axios.post(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/request/permission/room`,
          { requestId },
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        );

        setRefreshTrigger((prev) => prev + 1);
      } catch (error) {}
    }
  };

  const handleDecline = async (requestId: string) => {
    try {
      await axios.delete(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/request/permission/room`,
        {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
          data: { requestId: requestId },
        }
      );

      setRefreshTrigger((prev) => prev + 1);
    } catch (error) {}
  };

  return (
    <Container>
      <DaysInputDialog
        open={isDialogOpen}
        onSubmit={handleDialogSubmit}
        onCancel={() => setIsDialogOpen(false)}
      />
      <Typography
        variant="h4"
        component="h1"
        gutterBottom
        className="text-center mb-6"
      >
        Requests Room Permission
      </Typography>
      <TableContainer component={Paper}>
        <Table aria-label="accounts table">
          <TableHead>
            <TableRow>
              <TableCell align="center">Room</TableCell>
              <TableCell align="center">Username</TableCell>
              <TableCell align="center">Type</TableCell>
              <TableCell align="center">Message</TableCell>
              <TableCell align="center">Actions</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {requests.map((request) => (
              <TableRow key={request.id}>
                <TableCell align="center">{request.roomName}</TableCell>
                <TableCell align="center">{request.username}</TableCell>
                <TableCell align="center">{request.type}</TableCell>
                <TableCell align="center">{request.requestMessage}</TableCell>
                <TableCell align="center">
                  <Button
                    sx={{
                      color: "green",
                      "&:hover": { bgcolor: "#e8f5e9", color: "darkgreen" },
                    }}
                    onClick={() => handleAccept(request.id, request.type)}
                  >
                    Accept
                  </Button>
                  <Button
                    sx={{
                      color: "red",
                      "&:hover": { bgcolor: "#ffebee", color: "darkred" },
                    }}
                    onClick={() => handleDecline(request.id)}
                  >
                    Decline
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

export default RequestsRoomPermisionRoomList;
