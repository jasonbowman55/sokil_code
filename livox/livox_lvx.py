# Prof. Jason's attempt to read an lvx file using the lvx library.
# pip install livox-lvx

from lvx import LvxFileReader, LvxFileWriter

INPUT = '2024-11-14 18-22-35 left then right.lvx'

with open(INPUT, 'rb') as fi, open(INPUT + '.other', 'wb') as fo:
    lvx_in = LvxFileReader(fi)
    header = lvx_in.header
    lvx_out = LvxFileWriter(header, fo)

    for frame in lvx_in:
        lvx_out.write_frame(frame, True)
        
