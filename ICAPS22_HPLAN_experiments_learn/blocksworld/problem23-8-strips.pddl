( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b593 - block
    b415 - block
    b775 - block
    b851 - block
    b374 - block
    b78 - block
    b121 - block
    b906 - block
    b419 - block
    b861 - block
    b331 - block
    b488 - block
    b287 - block
    b603 - block
    b754 - block
    b817 - block
    b853 - block
    b84 - block
    b264 - block
    b923 - block
    b139 - block
    b489 - block
    b562 - block
    b42 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b593 )
    ( on b415 b593 )
    ( on b775 b415 )
    ( on b851 b775 )
    ( on b374 b851 )
    ( on b78 b374 )
    ( on b121 b78 )
    ( on b906 b121 )
    ( on b419 b906 )
    ( on b861 b419 )
    ( on b331 b861 )
    ( on b488 b331 )
    ( on b287 b488 )
    ( on b603 b287 )
    ( on b754 b603 )
    ( on b817 b754 )
    ( on b853 b817 )
    ( on b84 b853 )
    ( on b264 b84 )
    ( on b923 b264 )
    ( on b139 b923 )
    ( on b489 b139 )
    ( on b562 b489 )
    ( on b42 b562 )
    ( clear b42 )
  )
  ( :goal
    ( and
      ( clear b593 )
    )
  )
)
