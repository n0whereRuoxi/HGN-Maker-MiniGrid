( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b852 - block
    b130 - block
    b570 - block
    b82 - block
    b977 - block
    b140 - block
    b262 - block
    b557 - block
    b851 - block
    b607 - block
    b494 - block
    b231 - block
    b465 - block
    b873 - block
    b381 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b852 )
    ( on b130 b852 )
    ( on b570 b130 )
    ( on b82 b570 )
    ( on b977 b82 )
    ( on b140 b977 )
    ( on b262 b140 )
    ( on b557 b262 )
    ( on b851 b557 )
    ( on b607 b851 )
    ( on b494 b607 )
    ( on b231 b494 )
    ( on b465 b231 )
    ( on b873 b465 )
    ( on b381 b873 )
    ( clear b381 )
  )
  ( :goal
    ( and
      ( clear b852 )
    )
  )
)
