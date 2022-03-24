( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b726 - block
    b259 - block
    b451 - block
    b952 - block
    b751 - block
    b877 - block
    b130 - block
    b341 - block
    b869 - block
    b997 - block
    b246 - block
    b521 - block
    b190 - block
    b95 - block
    b267 - block
    b399 - block
    b100 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b726 )
    ( on b259 b726 )
    ( on b451 b259 )
    ( on b952 b451 )
    ( on b751 b952 )
    ( on b877 b751 )
    ( on b130 b877 )
    ( on b341 b130 )
    ( on b869 b341 )
    ( on b997 b869 )
    ( on b246 b997 )
    ( on b521 b246 )
    ( on b190 b521 )
    ( on b95 b190 )
    ( on b267 b95 )
    ( on b399 b267 )
    ( on b100 b399 )
    ( clear b100 )
  )
  ( :goal
    ( and
      ( clear b726 )
    )
  )
)
