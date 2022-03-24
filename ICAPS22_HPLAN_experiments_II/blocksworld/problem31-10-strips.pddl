( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b946 - block
    b901 - block
    b377 - block
    b938 - block
    b779 - block
    b166 - block
    b47 - block
    b208 - block
    b628 - block
    b488 - block
    b653 - block
    b590 - block
    b864 - block
    b735 - block
    b455 - block
    b392 - block
    b130 - block
    b100 - block
    b447 - block
    b452 - block
    b838 - block
    b906 - block
    b11 - block
    b783 - block
    b330 - block
    b223 - block
    b993 - block
    b323 - block
    b265 - block
    b190 - block
    b853 - block
    b957 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b946 )
    ( on b901 b946 )
    ( on b377 b901 )
    ( on b938 b377 )
    ( on b779 b938 )
    ( on b166 b779 )
    ( on b47 b166 )
    ( on b208 b47 )
    ( on b628 b208 )
    ( on b488 b628 )
    ( on b653 b488 )
    ( on b590 b653 )
    ( on b864 b590 )
    ( on b735 b864 )
    ( on b455 b735 )
    ( on b392 b455 )
    ( on b130 b392 )
    ( on b100 b130 )
    ( on b447 b100 )
    ( on b452 b447 )
    ( on b838 b452 )
    ( on b906 b838 )
    ( on b11 b906 )
    ( on b783 b11 )
    ( on b330 b783 )
    ( on b223 b330 )
    ( on b993 b223 )
    ( on b323 b993 )
    ( on b265 b323 )
    ( on b190 b265 )
    ( on b853 b190 )
    ( on b957 b853 )
    ( clear b957 )
  )
  ( :goal
    ( and
      ( clear b946 )
    )
  )
)
