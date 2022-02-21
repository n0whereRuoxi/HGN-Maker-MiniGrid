( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b442 - block
    b652 - block
    b430 - block
    b942 - block
    b138 - block
    b826 - block
    b527 - block
    b177 - block
    b962 - block
    b578 - block
    b207 - block
    b519 - block
    b316 - block
    b996 - block
    b944 - block
    b9 - block
    b301 - block
    b637 - block
    b966 - block
    b487 - block
    b140 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b442 )
    ( on b652 b442 )
    ( on b430 b652 )
    ( on b942 b430 )
    ( on b138 b942 )
    ( on b826 b138 )
    ( on b527 b826 )
    ( on b177 b527 )
    ( on b962 b177 )
    ( on b578 b962 )
    ( on b207 b578 )
    ( on b519 b207 )
    ( on b316 b519 )
    ( on b996 b316 )
    ( on b944 b996 )
    ( on b9 b944 )
    ( on b301 b9 )
    ( on b637 b301 )
    ( on b966 b637 )
    ( on b487 b966 )
    ( on b140 b487 )
    ( clear b140 )
  )
  ( :goal
    ( and
      ( clear b442 )
    )
  )
)
