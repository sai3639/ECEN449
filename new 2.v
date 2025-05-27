
8
Laboratory Exercise #2
#
c l o c k
r t l
s e t
p r o p e r t y PACKAGE
PIN K17 [ g e t
p o r t s clk
100MHz ]
s e t
p r o p e r t y IOSTANDARD LVCMOS33 [ g e t
p o r t s clk
100MHz ]
c r e a t e
c l o c k −add −name s y s
c l k
p i n − p e r i o d 1 0 . 0 0 −waveform
{
0 5
}
[ g e t
p o r t s clk
100MHz ]
#
l e d
t r i
o
s e t
p r o p e r t y PACKAGE
PIN M14 [ g e t
p o r t s
{
l e d
t r i
o [ 0 ]
}
]
s e t
p r o p e r t y IOSTANDARD LVCMOS33 [ g e t
p o r t s
{
l e d
t r i
o [ 0 ]
}
]
s e t
p r o p e r t y PACKAGE
PIN M15 [ g e t
p o r t s
{
l e d
t r i
o [ 1 ]
}
]
s e t
p r o p e r t y IOSTANDARD LVCMOS33 [ g e t
p o r t s
{
l e d
t r i
o [ 1 ]
}
]
s e t
p r o p e r t y PACKAGE
PIN G14 [ g e t
p o r t s
{
l e d
t r i
o [ 2 ]
}
]
s e t
p r o p e r t y IOSTANDARD LVCMOS33 [ g e t
p o r t s
{
l e d
t r i
o [ 2 ]
}
]
s e t
p r o p e r t y PACKAGE
PIN D18 [ g e t
p o r t s
{
l e d
t r i
o [ 3 ]
}
]
s e t
p r o p e r t y IOSTANDARD LVCMOS33 [ g e t
p o r t s
{
l e d
t r i
o [ 3 ]
}
