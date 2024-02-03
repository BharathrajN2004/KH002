import mongoose from "mongoose";

const userSchema = new mongoose.Schema(
{
  firstName: {
    type: String,
    required: true,
    minlength: 2,
    maxlength: 50,
  },
  lastName: {
    type: String,
    required: true,
    minlength: 1,
    maxlength: 50,
  },
  profileImage: {
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
    type: paymentSchema,
    required: true
  }
}, 
{ 
  timestamps: true 
}
);

const User = mongoose.model('User', userSchema);

export default User;
