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
      description,
      date,
      order_id,
      
    } = req.body;

    const passwordHash = await bcrypt.hash(password, 10);

    const newTransaction = new Transaction({
      sender_id,
      receiver_id ,
      amount,
      description,
      date,
      order_id,
    });

    const savedTransaction = await newTransaction.save();
    res.status(201).json(savedTransaction);
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
};


