import mongoose, { Schema } from "mongoose";
import User from "User";

const transactionSchema = new mongoose.Schema({
    sender_id: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        required: true,
    },
    receiver_id: {
        type: Schema.Types.ObjectId,
        ref: 'User',
        required: true,
    },
    amount: { 
        type: Number, 
        required: true 
    },
    description: { 
        type: String, 
        required: false 
    },
    order_id: {
        type:  String,
        required: true
    },
    date: {
        type: Date,
        required: true
    }
});

const Transactions = mongoose.model("Transactions", transactionSchema);

export default Transactions;
