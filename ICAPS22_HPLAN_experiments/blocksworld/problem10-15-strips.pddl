( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b790 - block
    b266 - block
    b438 - block
    b374 - block
    b408 - block
    b693 - block
    b207 - block
    b144 - block
    b147 - block
    b257 - block
    b850 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b790 )
    ( on b266 b790 )
    ( on b438 b266 )
    ( on b374 b438 )
    ( on b408 b374 )
    ( on b693 b408 )
    ( on b207 b693 )
    ( on b144 b207 )
    ( on b147 b144 )
    ( on b257 b147 )
    ( on b850 b257 )
    ( clear b850 )
  )
  ( :goal
    ( and
      ( clear b790 )
    )
  )
)
