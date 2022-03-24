( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b439 - block
    b464 - block
    b119 - block
    b348 - block
    b9 - block
    b375 - block
    b256 - block
    b303 - block
    b215 - block
    b621 - block
    b242 - block
    b342 - block
    b918 - block
    b389 - block
    b595 - block
    b644 - block
    b984 - block
    b508 - block
    b499 - block
    b437 - block
    b624 - block
    b177 - block
    b155 - block
    b95 - block
    b400 - block
    b361 - block
    b426 - block
    b890 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b439 )
    ( on b464 b439 )
    ( on b119 b464 )
    ( on b348 b119 )
    ( on b9 b348 )
    ( on b375 b9 )
    ( on b256 b375 )
    ( on b303 b256 )
    ( on b215 b303 )
    ( on b621 b215 )
    ( on b242 b621 )
    ( on b342 b242 )
    ( on b918 b342 )
    ( on b389 b918 )
    ( on b595 b389 )
    ( on b644 b595 )
    ( on b984 b644 )
    ( on b508 b984 )
    ( on b499 b508 )
    ( on b437 b499 )
    ( on b624 b437 )
    ( on b177 b624 )
    ( on b155 b177 )
    ( on b95 b155 )
    ( on b400 b95 )
    ( on b361 b400 )
    ( on b426 b361 )
    ( on b890 b426 )
    ( clear b890 )
  )
  ( :goal
    ( and
      ( clear b439 )
    )
  )
)
