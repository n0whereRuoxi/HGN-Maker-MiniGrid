( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b766 - block
    b107 - block
    b387 - block
    b532 - block
    b189 - block
    b218 - block
    b757 - block
    b618 - block
    b61 - block
    b665 - block
    b2 - block
    b595 - block
    b52 - block
    b933 - block
    b506 - block
    b892 - block
    b754 - block
    b428 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b766 )
    ( on b107 b766 )
    ( on b387 b107 )
    ( on b532 b387 )
    ( on b189 b532 )
    ( on b218 b189 )
    ( on b757 b218 )
    ( on b618 b757 )
    ( on b61 b618 )
    ( on b665 b61 )
    ( on b2 b665 )
    ( on b595 b2 )
    ( on b52 b595 )
    ( on b933 b52 )
    ( on b506 b933 )
    ( on b892 b506 )
    ( on b754 b892 )
    ( on b428 b754 )
    ( clear b428 )
  )
  ( :goal
    ( and
      ( clear b766 )
    )
  )
)
