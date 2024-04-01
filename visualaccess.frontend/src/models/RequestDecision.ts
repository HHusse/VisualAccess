export interface RequestDecision {
  approver: string;
  username: string;
  room: string;
  type: string;
  isApproved: boolean;
  time: number;
}
