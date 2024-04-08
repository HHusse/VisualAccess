import React from "react";
import { AppBar, Toolbar, IconButton, Box } from "@mui/material";
import LogoutIcon from "@mui/icons-material/Logout";
import { useNavigate } from "react-router-dom";

const Navbar: React.FC = () => {
  const navigate = useNavigate();

  const onLogout = () => {
    localStorage.removeItem("token");
    navigate("/login");
  };

  return (
    <AppBar
      position="static"
      elevation={3}
      sx={{
        bgcolor: "black",
        borderRadius: { xs: "0 0 10px 10px", sm: "0 0 20px 20px" },
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
            className="max-h-[50px] md:max-h-[100px] justify-center"
          />
        </Box>

        <IconButton
          edge="end"
          aria-label="logout"
          onClick={onLogout}
          sx={{
            fontSize: { xs: "0.75rem", sm: "1rem" },
            "& .MuiSvgIcon-root": {
              fontSize: { xs: "1.1rem", sm: "1.5rem" },
            },
            color: "white",
          }}
        >
          <LogoutIcon />
        </IconButton>
      </Toolbar>
    </AppBar>
  );
};

export default Navbar;
