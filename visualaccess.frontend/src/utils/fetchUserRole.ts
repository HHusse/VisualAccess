import axios from "axios";

export async function fetchUserRole(token: string): Promise<string | null> {
  try {
    const response = await axios.get(
      `${process.env.REACT_APP_BACKEND_URL}/api/v1/account/info`,
      {
        headers: {
          Authorization: `Bearer ${token}`,
          "Content-Type": "application/json",
        },
      }
    );

    return response.data.role;
  } catch (error) {
    console.error("Error fetching user role:", error);
    return null;
  }
}
