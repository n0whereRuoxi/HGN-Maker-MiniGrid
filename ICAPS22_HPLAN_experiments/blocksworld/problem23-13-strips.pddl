( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b936 - block
    b953 - block
    b762 - block
    b293 - block
    b924 - block
    b10 - block
    b846 - block
    b766 - block
    b411 - block
    b496 - block
    b603 - block
    b624 - block
    b709 - block
    b415 - block
    b398 - block
    b58 - block
    b489 - block
    b21 - block
    b819 - block
    b378 - block
    b697 - block
    b300 - block
    b635 - block
    b390 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b936 )
    ( on b953 b936 )
    ( on b762 b953 )
    ( on b293 b762 )
    ( on b924 b293 )
    ( on b10 b924 )
    ( on b846 b10 )
    ( on b766 b846 )
    ( on b411 b766 )
    ( on b496 b411 )
    ( on b603 b496 )
    ( on b624 b603 )
    ( on b709 b624 )
    ( on b415 b709 )
    ( on b398 b415 )
    ( on b58 b398 )
    ( on b489 b58 )
    ( on b21 b489 )
    ( on b819 b21 )
    ( on b378 b819 )
    ( on b697 b378 )
    ( on b300 b697 )
    ( on b635 b300 )
    ( on b390 b635 )
    ( clear b390 )
  )
  ( :goal
    ( and
      ( clear b936 )
    )
  )
)
