import mongoose from "mongoose";

const paymentSchema = new mongoose.Schema({
    mPin: {
        type: Number,
        required: true,
        length: 6
    },
    bankDetails: {
      type: [bankSchema]
    },
    upiId: {
        type: String,
        unique: true,
        match: /^[A-Za-z]{4}\d{6}[A-Za-z]{2}$/,
    },
    cardSelection: {
        type: String,
        required: true,
        enum : ["Debit Card", "Credit Card"],
    },
    cardType: {
        type: String,
        required: true,
        enum : ["RuPay", "Visa", "MasterCard"],
    },
    cardNumber: {
        type: Number,
        required: true,
    },
    cvv: {
        type: Number,
        required: true,
    },
    cardExpiry: {
        type: String,
        required: true,
    },
    cardHolderName: {
        type: String,
        required: true
    }
})

const cardSchema  = new mongoose.Schema({
    cardType: {
        type: String,
        enum: ["Credit Card", "Debit Card"],

    } 
})

const bankSchema  = new mongoose.Schema({
    bankName: {
        type: String,
    } 
})


const Payment = mongoose.model('Payment', paymentSchema);

export default Payment;