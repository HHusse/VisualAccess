import CircularProgress from "@mui/material/CircularProgress";

const LoadingComponent = () => {
  return (
    <div className="flex flex-col items-center justify-center min-h-screen">
      <img src={`${process.env.PUBLIC_URL}/visualaccesslogo.png`} alt="Logo" />
      <CircularProgress sx={{ color: "black" }} />
    </div>
  );
};

export default LoadingComponent;
