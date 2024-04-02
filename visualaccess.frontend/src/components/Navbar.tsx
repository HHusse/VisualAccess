import React from "react";
import { AppBar, Toolbar, IconButton, Box, useTheme } from "@mui/material";
import LogoutIcon from "@mui/icons-material/Logout";
import { useNavigate } from "react-router-dom";

const Navbar: React.FC = () => {
  const theme = useTheme();
  const navigate = useNavigate();

  const onLogout = () => {
    localStorage.removeItem("token");
    navigate("/login");
  };

  return (
    <AppBar
      position="static"
      sx={{
        bgcolor: "black",
        borderRadius: "0 0 20px 20px",
        boxShadow: theme.shadows[4],
      }}
    >
      <Toolbar
        sx={{
          display: "flex",
          justifyContent: "space-between",
          alignItems: "center",
        }}
      >
        <Box sx={{ flexGrow: 1, display: "flex", justifyContent: "center" }}>
          <img
            src="/visualaccesslogowhite.png"
            alt="Logo"
            style={{ maxHeight: "100px" }}
          />
        </Box>

        <IconButton
          edge="end"
          color="inherit"
          aria-label="logout"
          onClick={onLogout}
        >
          <LogoutIcon />
        </IconButton>
      </Toolbar>
    </AppBar>
  );
};

export default Navbar;
