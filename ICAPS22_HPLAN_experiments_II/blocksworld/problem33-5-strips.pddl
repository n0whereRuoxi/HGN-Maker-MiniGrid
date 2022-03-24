( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b329 - block
    b974 - block
    b766 - block
    b80 - block
    b345 - block
    b125 - block
    b7 - block
    b446 - block
    b930 - block
    b262 - block
    b907 - block
    b122 - block
    b476 - block
    b168 - block
    b208 - block
    b298 - block
    b678 - block
    b299 - block
    b305 - block
    b674 - block
    b552 - block
    b536 - block
    b334 - block
    b326 - block
    b711 - block
    b781 - block
    b895 - block
    b909 - block
    b635 - block
    b911 - block
    b228 - block
    b676 - block
    b192 - block
    b760 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b329 )
    ( on b974 b329 )
    ( on b766 b974 )
    ( on b80 b766 )
    ( on b345 b80 )
    ( on b125 b345 )
    ( on b7 b125 )
    ( on b446 b7 )
    ( on b930 b446 )
    ( on b262 b930 )
    ( on b907 b262 )
    ( on b122 b907 )
    ( on b476 b122 )
    ( on b168 b476 )
    ( on b208 b168 )
    ( on b298 b208 )
    ( on b678 b298 )
    ( on b299 b678 )
    ( on b305 b299 )
    ( on b674 b305 )
    ( on b552 b674 )
    ( on b536 b552 )
    ( on b334 b536 )
    ( on b326 b334 )
    ( on b711 b326 )
    ( on b781 b711 )
    ( on b895 b781 )
    ( on b909 b895 )
    ( on b635 b909 )
    ( on b911 b635 )
    ( on b228 b911 )
    ( on b676 b228 )
    ( on b192 b676 )
    ( on b760 b192 )
    ( clear b760 )
  )
  ( :goal
    ( and
      ( clear b329 )
    )
  )
)
