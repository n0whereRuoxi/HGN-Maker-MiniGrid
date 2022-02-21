( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b713 - block
    b609 - block
    b317 - block
    b143 - block
    b343 - block
    b857 - block
    b981 - block
    b702 - block
    b363 - block
    b778 - block
    b669 - block
    b684 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b713 )
    ( on b609 b713 )
    ( on b317 b609 )
    ( on b143 b317 )
    ( on b343 b143 )
    ( on b857 b343 )
    ( on b981 b857 )
    ( on b702 b981 )
    ( on b363 b702 )
    ( on b778 b363 )
    ( on b669 b778 )
    ( on b684 b669 )
    ( clear b684 )
  )
  ( :goal
    ( and
      ( clear b713 )
    )
  )
)
