( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b664 - block
    b230 - block
    b694 - block
    b625 - block
    b215 - block
    b502 - block
    b414 - block
    b29 - block
    b77 - block
    b913 - block
    b304 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b664 )
    ( on b230 b664 )
    ( on b694 b230 )
    ( on b625 b694 )
    ( on b215 b625 )
    ( on b502 b215 )
    ( on b414 b502 )
    ( on b29 b414 )
    ( on b77 b29 )
    ( on b913 b77 )
    ( on b304 b913 )
    ( clear b304 )
  )
  ( :goal
    ( and
      ( clear b664 )
    )
  )
)
