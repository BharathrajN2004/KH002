import mongoose from "mongoose";

const walletSchema = new mongoose.Schema({
    walletBalance: {
        type: Number,
        required: true,
        default: 0
    },
    walletType: {
        type: String,
        required: true
    }
})

const Wallet = mongoose.model('Wallet', walletSchema);

export default Wallet;