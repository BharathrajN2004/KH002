import mongoose from "mongoose";


const groupSchema = new mongoose.Schema({
    grpName: {
      type: String,
      required: true,
      minlength: 2,
      maxlength: 50,
    },
    members: {
        type: [userSchema],
        required: true,
    },
    grpPic: {
        type: Image,

    },
    prevSplits: {
        type: [splitSchema]
    }
})

const Group = mongoose.model('Group', groupSchema);

export default Group;