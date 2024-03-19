import React, { useState } from "react";
import Dialog from "@mui/material/Dialog";
import DialogActions from "@mui/material/DialogActions";
import DialogContent from "@mui/material/DialogContent";
import DialogTitle from "@mui/material/DialogTitle";
import Button from "@mui/material/Button";
import TextField from "@mui/material/TextField";
import Alert from "@mui/material/Alert";

interface DaysInputDialogProps {
  open: boolean;
  onSubmit: (days: number) => void;
  onCancel: () => void;
}

const DaysInputDialog: React.FC<DaysInputDialogProps> = ({
  open,
  onSubmit,
  onCancel,
}) => {
  const [days, setDays] = useState<string>("");
  const [errorMessage, setErrorMessage] = useState<string>("");

  const handleSubmit = () => {
    const numberOfDays = parseInt(days, 10);
    if (numberOfDays > 0) {
      setErrorMessage("");
      setDays("");
      onSubmit(numberOfDays);
    } else {
      setErrorMessage("Please enter a valid number of days.");
    }
  };

  const handleClosed = async () => {
    setErrorMessage("");
    setDays("");
    onCancel();
  };

  return (
    <Dialog open={open} onClose={handleClosed}>
      <DialogTitle>Enter number of days</DialogTitle>
      {errorMessage && (
        <Alert severity="error" className="w-full">
          {errorMessage}
        </Alert>
      )}
      <DialogContent>
        <TextField
          autoFocus
          margin="dense"
          id="days"
          label="Number of days"
          type="number"
          fullWidth
          variant="standard"
          value={days}
          onChange={(e) => setDays(e.target.value)}
          sx={{
            "& .MuiOutlinedInput-root.Mui-focused .MuiOutlinedInput-notchedOutline":
              {
                borderColor: "black",
              },
            "& .MuiInputLabel-root.Mui-focused": {
              color: "black",
            },
            '& input[type="number"]': {
              // Hide the spin button
              "&::-webkit-inner-spin-button, &::-webkit-outer-spin-button": {
                "-webkit-appearance": "none",
                margin: 0,
              },
              // For Firefox
              "&[type=number]": {
                "-moz-appearance": "textfield",
              },
            },
          }}
          InputProps={{
            sx: {
              "&:before": {
                borderBottom: "1px solid grey",
              },
              "&:hover:not(.Mui-disabled):before": {
                borderBottom: "2px solid black",
              },
              "&:after": {
                borderBottom: "2px solid black",
              },
            },
          }}
        />
      </DialogContent>
      <DialogActions>
        <Button
          onClick={handleClosed}
          sx={{
            color: "red",
            "&:hover": { bgcolor: "#ffebee", color: "darkred" },
          }}
        >
          Cancel
        </Button>
        <Button
          onClick={handleSubmit}
          sx={{
            color: "green",
            "&:hover": { bgcolor: "#e8f5e9", color: "darkgreen" },
          }}
        >
          Submit
        </Button>
      </DialogActions>
    </Dialog>
  );
};

export default DaysInputDialog;
