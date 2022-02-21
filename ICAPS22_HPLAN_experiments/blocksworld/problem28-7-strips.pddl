( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b948 - block
    b609 - block
    b930 - block
    b383 - block
    b734 - block
    b619 - block
    b575 - block
    b36 - block
    b171 - block
    b267 - block
    b558 - block
    b790 - block
    b243 - block
    b395 - block
    b466 - block
    b183 - block
    b289 - block
    b177 - block
    b370 - block
    b718 - block
    b23 - block
    b173 - block
    b768 - block
    b514 - block
    b303 - block
    b343 - block
    b402 - block
    b132 - block
    b997 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b948 )
    ( on b609 b948 )
    ( on b930 b609 )
    ( on b383 b930 )
    ( on b734 b383 )
    ( on b619 b734 )
    ( on b575 b619 )
    ( on b36 b575 )
    ( on b171 b36 )
    ( on b267 b171 )
    ( on b558 b267 )
    ( on b790 b558 )
    ( on b243 b790 )
    ( on b395 b243 )
    ( on b466 b395 )
    ( on b183 b466 )
    ( on b289 b183 )
    ( on b177 b289 )
    ( on b370 b177 )
    ( on b718 b370 )
    ( on b23 b718 )
    ( on b173 b23 )
    ( on b768 b173 )
    ( on b514 b768 )
    ( on b303 b514 )
    ( on b343 b303 )
    ( on b402 b343 )
    ( on b132 b402 )
    ( on b997 b132 )
    ( clear b997 )
  )
  ( :goal
    ( and
      ( clear b948 )
    )
  )
)
