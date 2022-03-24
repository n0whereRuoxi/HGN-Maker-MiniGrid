( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b938 - block
    b158 - block
    b106 - block
    b727 - block
    b206 - block
    b568 - block
    b478 - block
    b614 - block
    b196 - block
    b940 - block
    b580 - block
    b270 - block
    b208 - block
    b421 - block
    b54 - block
    b190 - block
    b588 - block
    b226 - block
    b815 - block
    b584 - block
    b1 - block
    b112 - block
    b277 - block
    b433 - block
    b407 - block
    b104 - block
    b869 - block
    b303 - block
    b338 - block
    b820 - block
    b632 - block
    b335 - block
    b576 - block
    b674 - block
    b599 - block
    b566 - block
    b936 - block
    b120 - block
    b813 - block
    b13 - block
    b333 - block
    b8 - block
    b838 - block
    b251 - block
    b211 - block
    b578 - block
    b828 - block
    b285 - block
    b998 - block
    b71 - block
    b179 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b938 )
    ( on b158 b938 )
    ( on b106 b158 )
    ( on b727 b106 )
    ( on b206 b727 )
    ( on b568 b206 )
    ( on b478 b568 )
    ( on b614 b478 )
    ( on b196 b614 )
    ( on b940 b196 )
    ( on b580 b940 )
    ( on b270 b580 )
    ( on b208 b270 )
    ( on b421 b208 )
    ( on b54 b421 )
    ( on b190 b54 )
    ( on b588 b190 )
    ( on b226 b588 )
    ( on b815 b226 )
    ( on b584 b815 )
    ( on b1 b584 )
    ( on b112 b1 )
    ( on b277 b112 )
    ( on b433 b277 )
    ( on b407 b433 )
    ( on b104 b407 )
    ( on b869 b104 )
    ( on b303 b869 )
    ( on b338 b303 )
    ( on b820 b338 )
    ( on b632 b820 )
    ( on b335 b632 )
    ( on b576 b335 )
    ( on b674 b576 )
    ( on b599 b674 )
    ( on b566 b599 )
    ( on b936 b566 )
    ( on b120 b936 )
    ( on b813 b120 )
    ( on b13 b813 )
    ( on b333 b13 )
    ( on b8 b333 )
    ( on b838 b8 )
    ( on b251 b838 )
    ( on b211 b251 )
    ( on b578 b211 )
    ( on b828 b578 )
    ( on b285 b828 )
    ( on b998 b285 )
    ( on b71 b998 )
    ( on b179 b71 )
    ( clear b179 )
  )
  ( :tasks
    ( Make-50Pile b158 b106 b727 b206 b568 b478 b614 b196 b940 b580 b270 b208 b421 b54 b190 b588 b226 b815 b584 b1 b112 b277 b433 b407 b104 b869 b303 b338 b820 b632 b335 b576 b674 b599 b566 b936 b120 b813 b13 b333 b8 b838 b251 b211 b578 b828 b285 b998 b71 b179 )
  )
)
