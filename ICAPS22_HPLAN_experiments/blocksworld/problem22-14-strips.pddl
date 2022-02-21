( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b300 - block
    b874 - block
    b816 - block
    b475 - block
    b343 - block
    b366 - block
    b255 - block
    b511 - block
    b986 - block
    b285 - block
    b11 - block
    b56 - block
    b202 - block
    b549 - block
    b566 - block
    b317 - block
    b467 - block
    b718 - block
    b339 - block
    b683 - block
    b245 - block
    b437 - block
    b266 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b300 )
    ( on b874 b300 )
    ( on b816 b874 )
    ( on b475 b816 )
    ( on b343 b475 )
    ( on b366 b343 )
    ( on b255 b366 )
    ( on b511 b255 )
    ( on b986 b511 )
    ( on b285 b986 )
    ( on b11 b285 )
    ( on b56 b11 )
    ( on b202 b56 )
    ( on b549 b202 )
    ( on b566 b549 )
    ( on b317 b566 )
    ( on b467 b317 )
    ( on b718 b467 )
    ( on b339 b718 )
    ( on b683 b339 )
    ( on b245 b683 )
    ( on b437 b245 )
    ( on b266 b437 )
    ( clear b266 )
  )
  ( :goal
    ( and
      ( clear b300 )
    )
  )
)
