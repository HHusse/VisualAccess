import React, { useState, ComponentType } from "react";
import IconButton from "@mui/material/IconButton";
import RefreshIcon from "@mui/icons-material/Refresh";

function withRefresh<T>(WrappedComponent: ComponentType<T>) {
  const RefreshableComponent: React.FC<T> = (props) => {
    const [refresh, setRefresh] = useState<number>(0);

    const makeRefresh = () => {
      setRefresh((tick) => tick + 1);
    };

    return (
      <>
        <div style={{ textAlign: "center" }}>
          <IconButton
            onClick={makeRefresh}
            aria-label="refresh"
            color="default"
            size="small"
          >
            <RefreshIcon onClick={makeRefresh} style={{ color: "black" }} />
          </IconButton>
        </div>
        <WrappedComponent {...(props as T)} key={refresh} />
      </>
    );
  };

  return RefreshableComponent;
}

export default withRefresh;
