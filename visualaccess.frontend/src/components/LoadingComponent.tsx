import React from "react";
import CircularProgress from "@mui/material/CircularProgress";

const LoadingComponent = () => {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen">
      <img
        src={`${process.env.PUBLIC_URL}/visualaccesslogo.png`}
        alt="Logo"
        className="mb-5"
      />
      <CircularProgress sx={{ color: "black" }} />
    </div>
  );
};

export default LoadingComponent;
