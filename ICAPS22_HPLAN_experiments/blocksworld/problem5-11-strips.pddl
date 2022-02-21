( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b853 - block
    b720 - block
    b921 - block
    b356 - block
    b391 - block
    b466 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b853 )
    ( on b720 b853 )
    ( on b921 b720 )
    ( on b356 b921 )
    ( on b391 b356 )
    ( on b466 b391 )
    ( clear b466 )
  )
  ( :goal
    ( and
      ( clear b853 )
    )
  )
)
