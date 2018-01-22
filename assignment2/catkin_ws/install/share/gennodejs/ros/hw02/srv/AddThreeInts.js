// Auto-generated. Do not edit!

// (in-package hw02.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class AddThreeIntsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.x = null;
      this.y = null;
      this.z = null;
    }
    else {
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0;
      }
      if (initObj.hasOwnProperty('z')) {
        this.z = initObj.z
      }
      else {
        this.z = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddThreeIntsRequest
    // Serialize message field [x]
    bufferOffset = _serializer.int64(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.int64(obj.y, buffer, bufferOffset);
    // Serialize message field [z]
    bufferOffset = _serializer.int64(obj.z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddThreeIntsRequest
    let len;
    let data = new AddThreeIntsRequest(null);
    // Deserialize message field [x]
    data.x = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [z]
    data.z = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hw02/AddThreeIntsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95da2541c9d6989c0876f480a9b1c7e4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 x
    int64 y
    int64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddThreeIntsRequest(null);
    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0
    }

    if (msg.z !== undefined) {
      resolved.z = msg.z;
    }
    else {
      resolved.z = 0
    }

    return resolved;
    }
};

class AddThreeIntsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.sum = null;
    }
    else {
      if (initObj.hasOwnProperty('sum')) {
        this.sum = initObj.sum
      }
      else {
        this.sum = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AddThreeIntsResponse
    // Serialize message field [sum]
    bufferOffset = _serializer.int64(obj.sum, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AddThreeIntsResponse
    let len;
    let data = new AddThreeIntsResponse(null);
    // Deserialize message field [sum]
    data.sum = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'hw02/AddThreeIntsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b88405221c77b1878a3cbbfff53428d7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 sum
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AddThreeIntsResponse(null);
    if (msg.sum !== undefined) {
      resolved.sum = msg.sum;
    }
    else {
      resolved.sum = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: AddThreeIntsRequest,
  Response: AddThreeIntsResponse,
  md5sum() { return '53028d7f0cdbf27905a5df65392f9c8b'; },
  datatype() { return 'hw02/AddThreeInts'; }
};
