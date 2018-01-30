"""LCM type definitions
This file automatically generated by lcm.
DO NOT MODIFY BY HAND!!!!
"""

try:
    import cStringIO.StringIO as BytesIO
except ImportError:
    from io import BytesIO
import struct

class gps(object):
    __slots__ = ["time", "latitude", "nsIndicator", "longitude", "ewIndicator", "altitude"]

    def __init__(self):
        self.time = 0.0
        self.latitude = 0.0
        self.nsIndicator = ""
        self.longitude = 0.0
        self.ewIndicator = ""
        self.altitude = 0.0

    def encode(self):
        buf = BytesIO()
        buf.write(gps._get_packed_fingerprint())
        self._encode_one(buf)
        return buf.getvalue()

    def _encode_one(self, buf):
        buf.write(struct.pack(">dd", self.time, self.latitude))
        __nsIndicator_encoded = self.nsIndicator.encode('utf-8')
        buf.write(struct.pack('>I', len(__nsIndicator_encoded)+1))
        buf.write(__nsIndicator_encoded)
        buf.write(b"\0")
        buf.write(struct.pack(">d", self.longitude))
        __ewIndicator_encoded = self.ewIndicator.encode('utf-8')
        buf.write(struct.pack('>I', len(__ewIndicator_encoded)+1))
        buf.write(__ewIndicator_encoded)
        buf.write(b"\0")
        buf.write(struct.pack(">d", self.altitude))

    def decode(data):
        if hasattr(data, 'read'):
            buf = data
        else:
            buf = BytesIO(data)
        if buf.read(8) != gps._get_packed_fingerprint():
            raise ValueError("Decode error")
        return gps._decode_one(buf)
    decode = staticmethod(decode)

    def _decode_one(buf):
        self = gps()
        self.time, self.latitude = struct.unpack(">dd", buf.read(16))
        __nsIndicator_len = struct.unpack('>I', buf.read(4))[0]
        self.nsIndicator = buf.read(__nsIndicator_len)[:-1].decode('utf-8', 'replace')
        self.longitude = struct.unpack(">d", buf.read(8))[0]
        __ewIndicator_len = struct.unpack('>I', buf.read(4))[0]
        self.ewIndicator = buf.read(__ewIndicator_len)[:-1].decode('utf-8', 'replace')
        self.altitude = struct.unpack(">d", buf.read(8))[0]
        return self
    _decode_one = staticmethod(_decode_one)

    _hash = None
    def _get_hash_recursive(parents):
        if gps in parents: return 0
        tmphash = (0x651911245530067c) & 0xffffffffffffffff
        tmphash  = (((tmphash<<1)&0xffffffffffffffff)  + (tmphash>>63)) & 0xffffffffffffffff
        return tmphash
    _get_hash_recursive = staticmethod(_get_hash_recursive)
    _packed_fingerprint = None

    def _get_packed_fingerprint():
        if gps._packed_fingerprint is None:
            gps._packed_fingerprint = struct.pack(">Q", gps._get_hash_recursive([]))
        return gps._packed_fingerprint
    _get_packed_fingerprint = staticmethod(_get_packed_fingerprint)

