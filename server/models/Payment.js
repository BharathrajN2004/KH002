import mongoose from "mongoose";

const cardSchema = new mongoose.Schema({
    cardType: {
        type: String,
        enum: ["Credit Card", "Debit Card"],
    },
    cardNetwork: {
        type: String,
        required: true,
        enum: ["RuPay", "Visa", "MasterCard"],
    },
    cardNumber: {
        type: Number,
        required: true,
        length: 16
    },
    cvv: {
        type: Number,
        required: true,
        length: 3
    },
    cardExpiry: {
        type: String,
        required: true,
    },
    cardHolderName: {
        type: String,
        required: true,
        minlength: 3,
        maxlength: 40
    }
})

const bankSchema = new mongoose.Schema({
    bankName: {
        type: String,
        required: true
    },
    bankBalance: {
        type: Number,
        required: true
    }
})

const upiSchema = new mongoose.Schema({
    upiId: {
        type: String,
        unique: true,
        match: /^[A-Za-z]{4}\d{6}[A-Za-z]{2}$/,
        required: true
    },
})

export const paymentSchema = new mongoose.Schema({
    mPin: {
        type: Number,
        required: true,
        length: 6
    },
    bankDetails: {
        type: [bankSchema]
    },
    upiDetails: {
        type: [upiSchema]
    },
    cardDetails: {
        type: [cardSchema]
    },
})




const Payment = mongoose.model('Payment', paymentSchema);

export default Payment;