( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b795 - block
    b874 - block
    b113 - block
    b549 - block
    b827 - block
    b285 - block
    b909 - block
    b226 - block
    b875 - block
    b66 - block
    b393 - block
    b706 - block
    b374 - block
    b357 - block
    b213 - block
    b4 - block
    b329 - block
    b553 - block
    b448 - block
    b783 - block
    b975 - block
    b471 - block
    b424 - block
    b576 - block
    b552 - block
    b189 - block
    b985 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b795 )
    ( on b874 b795 )
    ( on b113 b874 )
    ( on b549 b113 )
    ( on b827 b549 )
    ( on b285 b827 )
    ( on b909 b285 )
    ( on b226 b909 )
    ( on b875 b226 )
    ( on b66 b875 )
    ( on b393 b66 )
    ( on b706 b393 )
    ( on b374 b706 )
    ( on b357 b374 )
    ( on b213 b357 )
    ( on b4 b213 )
    ( on b329 b4 )
    ( on b553 b329 )
    ( on b448 b553 )
    ( on b783 b448 )
    ( on b975 b783 )
    ( on b471 b975 )
    ( on b424 b471 )
    ( on b576 b424 )
    ( on b552 b576 )
    ( on b189 b552 )
    ( on b985 b189 )
    ( clear b985 )
  )
  ( :goal
    ( and
      ( clear b795 )
    )
  )
)
