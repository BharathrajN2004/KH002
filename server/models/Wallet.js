import mongoose from "mongoose";

const walletSchema = new mongoose.Schema({
    walletBalance: {
        type: Number,
        
    }
})

const Wallet = mongoose.model('Wallet', userSchema);

export default Wallet;