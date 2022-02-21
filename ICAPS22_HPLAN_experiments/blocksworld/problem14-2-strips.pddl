( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b260 - block
    b802 - block
    b909 - block
    b818 - block
    b121 - block
    b562 - block
    b603 - block
    b409 - block
    b547 - block
    b20 - block
    b842 - block
    b677 - block
    b948 - block
    b790 - block
    b618 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b260 )
    ( on b802 b260 )
    ( on b909 b802 )
    ( on b818 b909 )
    ( on b121 b818 )
    ( on b562 b121 )
    ( on b603 b562 )
    ( on b409 b603 )
    ( on b547 b409 )
    ( on b20 b547 )
    ( on b842 b20 )
    ( on b677 b842 )
    ( on b948 b677 )
    ( on b790 b948 )
    ( on b618 b790 )
    ( clear b618 )
  )
  ( :goal
    ( and
      ( clear b260 )
    )
  )
)
