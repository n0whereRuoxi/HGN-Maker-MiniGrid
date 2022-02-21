( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b538 - block
    b424 - block
    b618 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b538 )
    ( on b424 b538 )
    ( on b618 b424 )
    ( clear b618 )
  )
  ( :goal
    ( and
      ( clear b538 )
    )
  )
)
