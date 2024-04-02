import React, { useState, useEffect } from "react";
import axios from "axios";
import {
  Box,
  List,
  ListItem,
  ListItemText,
  IconButton,
  Button,
  Typography,
} from "@mui/material";
import DeleteIcon from "@mui/icons-material/Delete";
import MarkChatUnreadIcon from "@mui/icons-material/MarkChatUnread";
import MarkChatReadIcon from "@mui/icons-material/MarkChatRead";
import { useAuth } from "../hooks/useAuth";

interface Notification {
  id: string;
  from: string;
  messageText: string;
  isRead: boolean;
}

const Notifications: React.FC = () => {
  const [notifications, setNotifications] = useState<Notification[]>([]);
  const { getToken } = useAuth();
  const token: string | null = getToken();

  useEffect(() => {
    axios
      .get(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/account/notifications`,
        {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
        }
      )
      .then((response) => {
        setNotifications(response.data.notifications);
      })
      .catch((error) => console.error("Error fetching notifications", error));
  }, [token]);

  const fetchNotifications = () => {
    axios
      .get(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/account/notifications`,
        {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
        }
      )
      .then((response) => {
        setNotifications(response.data.notifications);
      })
      .catch((error) => console.error("Error fetching notifications", error));
  };

  const handleReadUnread = (id: string, isRead: boolean) => {
    axios
      .patch(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/account/notification`,
        {
          id,
          isRead: !isRead,
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
        }
      )
      .then(() => {
        fetchNotifications();
      })
      .catch((error) =>
        console.error("Error updating notification status", error)
      );
  };

  const handleDelete = (id: string) => {
    axios
      .delete(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/account/notification`,
        {
          data: { id },
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
        }
      )
      .then(() => {
        fetchNotifications();
      })
      .catch((error) => console.error("Error deleting notification", error));
  };

  const handleReadUnreadAll = (isRead: boolean) => {
    axios
      .patch(
        `${process.env.REACT_APP_BACKEND_URL}/api/v1/account/notifications`,
        {
          isRead,
        },
        {
          headers: {
            Authorization: `Bearer ${token}`,
            "Content-Type": "application/json",
          },
        }
      )
      .then(() => {
        fetchNotifications();
      })
      .catch((error) =>
        console.error("Error updating all notifications", error)
      );
  };

  return (
    <Box>
      <Typography
        variant="h4"
        component="h1"
        gutterBottom
        className="text-center"
        sx={{ mb: 3 }}
      >
        Notifications
      </Typography>
      {notifications.length > 0 && (
        <>
          <Button
            variant="contained"
            startIcon={<MarkChatReadIcon />}
            onClick={() => handleReadUnreadAll(true)}
            sx={{ mr: 2, bgcolor: "black", "&:hover": { bgcolor: "black" } }}
          >
            Mark All Read
          </Button>
          <Button
            variant="contained"
            startIcon={<MarkChatUnreadIcon />}
            onClick={() => handleReadUnreadAll(false)}
            sx={{ mr: 2, bgcolor: "black", "&:hover": { bgcolor: "black" } }}
          >
            Mark All Unread
          </Button>
          <List>
            {notifications.map((notification) => (
              <ListItem
                key={notification.id}
                secondaryAction={
                  <>
                    <IconButton
                      edge="end"
                      onClick={() =>
                        handleReadUnread(notification.id, notification.isRead)
                      }
                    >
                      {notification.isRead ? (
                        <MarkChatUnreadIcon />
                      ) : (
                        <MarkChatReadIcon />
                      )}
                    </IconButton>
                    <IconButton
                      edge="end"
                      onClick={() => handleDelete(notification.id)}
                    >
                      <DeleteIcon />
                    </IconButton>
                  </>
                }
              >
                <ListItemText
                  primary={notification.messageText}
                  secondary={`From: ${notification.from}`}
                  primaryTypographyProps={{
                    style: {
                      fontWeight: notification.isRead ? "normal" : "bold",
                    },
                  }}
                  secondaryTypographyProps={{
                    style: {
                      fontWeight: notification.isRead ? "normal" : "bold",
                    },
                  }}
                />
              </ListItem>
            ))}
          </List>
        </>
      )}
    </Box>
  );
};

export default Notifications;
