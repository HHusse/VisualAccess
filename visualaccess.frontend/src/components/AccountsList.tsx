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
import { AccountInfo } from "../models/AccountInfo";

const AccountsList: React.FC = () => {
  const [accounts, setAccounts] = useState<AccountInfo[]>([]);
  const [page, setPage] = useState(1);
  const [maxPages, setMaxPages] = useState(0);
  const { getToken } = useAuth();
  const token: string | null = getToken();
  const [refreshTrigger, setRefreshTrigger] = useState<number>(0);
  const [errorMessage, setErrorMessage] = useState<string>();

  useEffect(() => {
    const fetchAccounts = async () => {
      try {
        const response = await axios.get(
          `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/accounts/${page}`,
          {
            headers: {
              Authorization: `Bearer ${token}`,
              "Content-Type": "application/json",
            },
          }
        );

        setAccounts(response.data.accounts);
        setMaxPages(response.data.maxPages);
      } catch (error: any) {
        if (error.response.status === 404) {
          setPage((prev) => prev - 1);
        }
      }
    };

    fetchAccounts();
  }, [page, token, refreshTrigger]);

  const handleCloseClick = () => {
    setErrorMessage("");
  };

  const handleDelete = async (usernmae: string) => {
    try {
      await axios.delete(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/manage/account`,
        {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
          data: { username: usernmae },
        }
      );

      setRefreshTrigger((prev) => prev + 1);
    } catch (error: any) {
      if (error.response.status === 400) {
        setErrorMessage(error.response.data.message);
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
        Accounts List
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
      <TableContainer component={Paper} elevation={3}>
        <Table aria-label="accounts table">
          <TableHead>
            <TableRow>
              <TableCell align="center">Username</TableCell>
              <TableCell align="center">First Name</TableCell>
              <TableCell align="center">Last Name</TableCell>
              <TableCell align="center">Email</TableCell>
              <TableCell align="center">Address</TableCell>
              <TableCell align="center">Phone Number</TableCell>
              <TableCell align="center">Face ID</TableCell>
              <TableCell align="center">Role</TableCell>
              <TableCell align="center">Actions</TableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {accounts.map((account) => (
              <TableRow key={account.username}>
                <TableCell align="center">{account.username}</TableCell>
                <TableCell align="center">{account.firstName}</TableCell>
                <TableCell align="center">{account.lastName}</TableCell>
                <TableCell align="center">{account.email}</TableCell>
                <TableCell align="center">{account.address}</TableCell>
                <TableCell align="center">{account.phoneNumber}</TableCell>
                <TableCell align="center">{account.faceID}</TableCell>
                <TableCell align="center">{account.role}</TableCell>
                <TableCell align="center">
                  <Button
                    sx={{
                      color: "red",
                      "&:hover": { bgcolor: "#ffebee", color: "darkred" },
                    }}
                    onClick={() => handleDelete(account.username)}
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

export default AccountsList;
