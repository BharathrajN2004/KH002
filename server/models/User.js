import mongoose from "mongoose";

const userSchema = new mongoose.Schema(
{
  name: {
    type: String,
    required: true,
    minlength: 2,
    maxlength: 50,
  },
  profilePic: {
  type: profileImageSchema,
  },
  dob: {
    type: String,
    required: true
  },
  email: {
    type: String,
    required: true,
    maxlength: 50,
    unique: true,
  },
  password: {
    type: String,
    required: true,
    minlength: 5,
  },
  location: {
    type: String,
    required: true,
  },
  paymentDetail: {
    type: paymentSchema
  },
  transactionHistory: {
    type: Schema.Types.ObjectId,
    ref: 'Transactions'
  }
}, 
{ 
  timestamps: true 
}
);

const User = mongoose.model('User', userSchema);

export default User;
