( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b51 - block
    b744 - block
    b502 - block
    b968 - block
    b195 - block
    b709 - block
    b415 - block
    b713 - block
    b126 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b51 )
    ( on b744 b51 )
    ( on b502 b744 )
    ( on b968 b502 )
    ( on b195 b968 )
    ( on b709 b195 )
    ( on b415 b709 )
    ( on b713 b415 )
    ( on b126 b713 )
    ( clear b126 )
  )
  ( :goal
    ( and
      ( clear b51 )
    )
  )
)
