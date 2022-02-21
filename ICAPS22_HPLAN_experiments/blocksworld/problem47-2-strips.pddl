( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b205 - block
    b483 - block
    b576 - block
    b433 - block
    b145 - block
    b121 - block
    b600 - block
    b274 - block
    b502 - block
    b488 - block
    b101 - block
    b952 - block
    b901 - block
    b28 - block
    b626 - block
    b351 - block
    b150 - block
    b332 - block
    b780 - block
    b631 - block
    b863 - block
    b96 - block
    b875 - block
    b458 - block
    b816 - block
    b723 - block
    b772 - block
    b36 - block
    b843 - block
    b590 - block
    b640 - block
    b774 - block
    b741 - block
    b547 - block
    b417 - block
    b980 - block
    b333 - block
    b210 - block
    b223 - block
    b72 - block
    b466 - block
    b24 - block
    b407 - block
    b442 - block
    b411 - block
    b188 - block
    b62 - block
    b566 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b205 )
    ( on b483 b205 )
    ( on b576 b483 )
    ( on b433 b576 )
    ( on b145 b433 )
    ( on b121 b145 )
    ( on b600 b121 )
    ( on b274 b600 )
    ( on b502 b274 )
    ( on b488 b502 )
    ( on b101 b488 )
    ( on b952 b101 )
    ( on b901 b952 )
    ( on b28 b901 )
    ( on b626 b28 )
    ( on b351 b626 )
    ( on b150 b351 )
    ( on b332 b150 )
    ( on b780 b332 )
    ( on b631 b780 )
    ( on b863 b631 )
    ( on b96 b863 )
    ( on b875 b96 )
    ( on b458 b875 )
    ( on b816 b458 )
    ( on b723 b816 )
    ( on b772 b723 )
    ( on b36 b772 )
    ( on b843 b36 )
    ( on b590 b843 )
    ( on b640 b590 )
    ( on b774 b640 )
    ( on b741 b774 )
    ( on b547 b741 )
    ( on b417 b547 )
    ( on b980 b417 )
    ( on b333 b980 )
    ( on b210 b333 )
    ( on b223 b210 )
    ( on b72 b223 )
    ( on b466 b72 )
    ( on b24 b466 )
    ( on b407 b24 )
    ( on b442 b407 )
    ( on b411 b442 )
    ( on b188 b411 )
    ( on b62 b188 )
    ( on b566 b62 )
    ( clear b566 )
  )
  ( :goal
    ( and
      ( clear b205 )
    )
  )
)
