import bcrypt from "bcrypt";
import jwt from "jsonwebtoken";
import Transaction from "../models/Transactions.js";

/* REGISTER USER */
export const createTransaction = async (req, res) => {
  try {
    const {
      sender_id,
      receiver_id,
      amount,
      date,
      order_id,
      
    } = req.body;

    const passwordHash = await bcrypt.hash(password, 10);

    const newUser = new Transaction({
        "user_id": sender_id,

      
    });
    const savedUser = await newUser.save();
    res.status(201).json(savedUser);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};

/* LOGGING IN */
export const login = async (req, res) => {
  try {
    const { email, password } = req.body;
    console.log(email,password);
    const user = await User.findOne({ email: email });
    if (!user) return res.status(400).json({ msg: "User does not exist. " });

    const isMatch = await bcrypt.compare(password, user.password);
    if (!isMatch) return res.status(400).json({ msg: "Invalid credentials. " });

    const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET);
    delete user.password;

    console.log(user.firstName + " " + user.lastName, " logined Successfully");
    console.log(token,user);
    res.status(200).json({ token, user });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};
