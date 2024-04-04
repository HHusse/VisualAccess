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
import { RequestDecision } from "../models/RequestDecision";

const RequestDecisionList: React.FC = () => {
  const [decisions, setDecisions] = useState<RequestDecision[]>([]);
  const [page, setPage] = useState<number>(1);
  const [maxPages, setMaxPages] = useState<number>(0);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  useEffect(() => {
    const fetchDecisions = async () => {
      try {
        const response = await axios.get(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/request/decisions/${page}`,
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        );

        setDecisions(response.data.requests);
        setMaxPages(response.data.maxPages);
      } catch (error) {}
    };

    fetchDecisions();
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
        Request Decisions
      </Typography>
      <TableContainer component={Paper} elevation={3}>
        <Table aria-label="request decisions table">
          <TableHead>
            <TableRow>
              <TableCell align="center">Approver</TableCell>
              <TableCell align="center">Username</TableCell>
              <TableCell align="center">Room</TableCell>
              <TableCell align="center">Type</TableCell>
              <TableCell align="center">Approved</TableCell>
              <TableCell align="center">Time</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {decisions &&
              decisions.map((decision, index) => (
                <TableRow key={index}>
                  <TableCell align="center">{decision.approver}</TableCell>
                  <TableCell align="center">{decision.username}</TableCell>
                  <TableCell align="center">{decision.room}</TableCell>
                  <TableCell align="center">{decision.type}</TableCell>
                  <TableCell align="center">
                    {decision.isApproved ? "Yes" : "No"}
                  </TableCell>
                  <TableCell align="center">
                    {new Date(decision.time * 1000).toLocaleString()}
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

export default RequestDecisionList;
