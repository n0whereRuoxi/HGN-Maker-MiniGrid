( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b997 - block
    b835 - block
    b118 - block
    b955 - block
    b438 - block
    b623 - block
    b985 - block
    b428 - block
    b989 - block
    b435 - block
    b479 - block
    b786 - block
    b723 - block
    b424 - block
    b988 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b997 )
    ( on b835 b997 )
    ( on b118 b835 )
    ( on b955 b118 )
    ( on b438 b955 )
    ( on b623 b438 )
    ( on b985 b623 )
    ( on b428 b985 )
    ( on b989 b428 )
    ( on b435 b989 )
    ( on b479 b435 )
    ( on b786 b479 )
    ( on b723 b786 )
    ( on b424 b723 )
    ( on b988 b424 )
    ( clear b988 )
  )
  ( :goal
    ( and
      ( clear b997 )
    )
  )
)
