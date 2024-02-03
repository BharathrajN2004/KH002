import mongoose, { Schema } from "mongoose";
import User from "User";

const transactionSchema = new mongoose.Schema({
  receiverId: {
    type: Schema.Types.ObjectId,
    ref: 'User',
    required: true,
  },
  // senderId:
  amount: { type: Number, required: true },
  description: { type: String, required: false },
});

const Transactions = mongoose.model("Transactions", transactionSchema);

export default Transactions;
