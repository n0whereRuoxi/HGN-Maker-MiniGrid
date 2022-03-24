( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b226 - block
    b35 - block
    b299 - block
    b304 - block
    b486 - block
    b153 - block
    b949 - block
    b174 - block
    b204 - block
    b867 - block
    b727 - block
    b399 - block
    b563 - block
    b137 - block
    b393 - block
    b935 - block
    b312 - block
    b325 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b226 )
    ( on b35 b226 )
    ( on b299 b35 )
    ( on b304 b299 )
    ( on b486 b304 )
    ( on b153 b486 )
    ( on b949 b153 )
    ( on b174 b949 )
    ( on b204 b174 )
    ( on b867 b204 )
    ( on b727 b867 )
    ( on b399 b727 )
    ( on b563 b399 )
    ( on b137 b563 )
    ( on b393 b137 )
    ( on b935 b393 )
    ( on b312 b935 )
    ( on b325 b312 )
    ( clear b325 )
  )
  ( :goal
    ( and
      ( clear b226 )
    )
  )
)
