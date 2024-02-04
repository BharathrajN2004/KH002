import mongoose, { Schema } from "mongoose";
// import { paymentSchema } from "./Payment.js";

const userSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true,
      minlength: 2,
      maxlength: 50,
    },
    // profilePic: {
    //   type: ,
    // },
    email: {
      type: String,
      required: true,
      maxlength: 50,
      unique: true,
    },
    phoneNo: {
      type: Number,
      required: true,
      length: 10,
    },
    password: {
      type: String,
      required: true,
      minlength: 5,
    },
    // paymentDetail: {
    //   type: paymentSchema
    // },
    // transactionHistory: {
    //   type: Schema.Types.ObjectId,
    //   ref: 'Transactions'
    // }
  },
  {
    timestamps: true
  }
);

const User = mongoose.model('User', userSchema);

export default User;
