( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b843 - block
    b42 - block
    b236 - block
    b248 - block
    b541 - block
    b413 - block
    b90 - block
    b410 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b843 )
    ( on b42 b843 )
    ( on b236 b42 )
    ( on b248 b236 )
    ( on b541 b248 )
    ( on b413 b541 )
    ( on b90 b413 )
    ( on b410 b90 )
    ( clear b410 )
  )
  ( :goal
    ( and
      ( clear b843 )
    )
  )
)
