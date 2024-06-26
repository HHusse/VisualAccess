import { TemporaryRoomPermissionInfo } from "./TemporaryRoomPermissionInfo";

export interface AccountInfo {
  username: string;
  firstName: string;
  lastName: string;
  email: string;
  address: string;
  phoneNumber: string;
  faceID: null | number;
  role: string;
  allowedRooms: string[];
  temporaryRoomPermissions: TemporaryRoomPermissionInfo[];
}
