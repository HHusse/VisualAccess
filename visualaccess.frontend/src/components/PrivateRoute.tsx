import React, { useEffect, useState, useRef } from "react";
import { Navigate } from "react-router-dom";
import { useAuth } from "../utils/useAuth";
import { fetchUserRole } from "../utils/fetchUserRole";
import LoadingComponent from "./LoadingComponent";

interface PrivateRouteProps {
  element: JSX.Element;
  requiredRole: string | null;
}

const PrivateRoute: React.FC<PrivateRouteProps> = ({
  element,
  requiredRole,
}) => {
  const { getToken } = useAuth();
  const [userRole, setUserRole] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  const tokenRef = useRef<string | null>(getToken());

  const sleep = (ms: number) =>
    new Promise((resolve) => setTimeout(resolve, ms));

  useEffect(() => {
    const fetchAndSetUserRole = async () => {
      await sleep(2000);
      if (!tokenRef.current) {
        setUserRole(null);
        setIsLoading(false);
        return;
      }

      const role = await fetchUserRole(tokenRef.current);
      setUserRole(role);
      setIsLoading(false);
    };

    fetchAndSetUserRole();
  }, []);

  if (isLoading) {
    return <LoadingComponent />;
  }

  if (requiredRole === "ANY") {
    return userRole ? element : <Navigate to="/login" />;
  }

  return userRole === requiredRole ? element : <Navigate to="/login" />;
};

export default PrivateRoute;
