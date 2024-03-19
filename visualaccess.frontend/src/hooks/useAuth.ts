import { useNavigate } from "react-router-dom";

export function useAuth() {
  const navigate = useNavigate();

  const getToken = (): string => {
    const token = localStorage.getItem("token");
    if (!token) {
      navigate("/login");
      return "";
    }
    return token;
  };

  return { getToken };
}
