( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b450 - block
    b722 - block
    b276 - block
    b925 - block
    b852 - block
    b991 - block
    b230 - block
    b463 - block
    b411 - block
    b291 - block
    b375 - block
    b483 - block
    b378 - block
    b140 - block
    b731 - block
    b312 - block
    b616 - block
    b79 - block
    b75 - block
    b853 - block
    b607 - block
    b165 - block
    b718 - block
    b803 - block
    b701 - block
    b756 - block
    b2 - block
    b517 - block
    b835 - block
    b690 - block
    b908 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b450 )
    ( on b722 b450 )
    ( on b276 b722 )
    ( on b925 b276 )
    ( on b852 b925 )
    ( on b991 b852 )
    ( on b230 b991 )
    ( on b463 b230 )
    ( on b411 b463 )
    ( on b291 b411 )
    ( on b375 b291 )
    ( on b483 b375 )
    ( on b378 b483 )
    ( on b140 b378 )
    ( on b731 b140 )
    ( on b312 b731 )
    ( on b616 b312 )
    ( on b79 b616 )
    ( on b75 b79 )
    ( on b853 b75 )
    ( on b607 b853 )
    ( on b165 b607 )
    ( on b718 b165 )
    ( on b803 b718 )
    ( on b701 b803 )
    ( on b756 b701 )
    ( on b2 b756 )
    ( on b517 b2 )
    ( on b835 b517 )
    ( on b690 b835 )
    ( on b908 b690 )
    ( clear b908 )
  )
  ( :goal
    ( and
      ( clear b450 )
    )
  )
)
