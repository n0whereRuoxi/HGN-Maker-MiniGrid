( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b837 - block
    b441 - block
    b372 - block
    b276 - block
    b619 - block
    b351 - block
    b374 - block
    b357 - block
    b939 - block
    b427 - block
    b100 - block
    b302 - block
    b342 - block
    b425 - block
    b158 - block
    b790 - block
    b589 - block
    b80 - block
    b246 - block
    b329 - block
    b749 - block
    b19 - block
    b239 - block
    b993 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b837 )
    ( on b441 b837 )
    ( on b372 b441 )
    ( on b276 b372 )
    ( on b619 b276 )
    ( on b351 b619 )
    ( on b374 b351 )
    ( on b357 b374 )
    ( on b939 b357 )
    ( on b427 b939 )
    ( on b100 b427 )
    ( on b302 b100 )
    ( on b342 b302 )
    ( on b425 b342 )
    ( on b158 b425 )
    ( on b790 b158 )
    ( on b589 b790 )
    ( on b80 b589 )
    ( on b246 b80 )
    ( on b329 b246 )
    ( on b749 b329 )
    ( on b19 b749 )
    ( on b239 b19 )
    ( on b993 b239 )
    ( clear b993 )
  )
  ( :goal
    ( and
      ( clear b837 )
    )
  )
)
