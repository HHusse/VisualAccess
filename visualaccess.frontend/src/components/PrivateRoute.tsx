import React, { useEffect, useState } from "react";
import { Navigate } from "react-router-dom";
import { useAuth } from "../utils/useAuth";
import { fetchUserRole } from "../utils/fetchUserRole";
import LoadingComponent from "./LoadingComponent";

interface PrivateRouteProps {
  element: JSX.Element;
  requiredRole: string;
}

const PrivateRoute: React.FC<PrivateRouteProps> = ({
  element,
  requiredRole,
}) => {
  const { getToken } = useAuth();
  const [userRole, setUserRole] = useState<string | null>(null);
  const [isLoading, setIsLoading] = useState(true);

  const sleep = (ms: number) =>
    new Promise((resolve) => setTimeout(resolve, ms));

  useEffect(() => {
    const fetchAndSetUserRole = async () => {
      await sleep(5000); // Simulated delay
      const token = getToken();

      if (!token) {
        setUserRole(null);
        setIsLoading(false);
        return;
      }

      const role = await fetchUserRole(token);
      setUserRole(role);
      setIsLoading(false);
    };

    fetchAndSetUserRole();
  }, [getToken]);

  if (isLoading) {
    return <LoadingComponent />;
  }

  return userRole === requiredRole ? element : <Navigate to="/login" />;
};

export default PrivateRoute;
