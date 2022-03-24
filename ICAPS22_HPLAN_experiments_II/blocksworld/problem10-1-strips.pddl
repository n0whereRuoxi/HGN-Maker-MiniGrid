( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b824 - block
    b586 - block
    b636 - block
    b231 - block
    b147 - block
    b110 - block
    b27 - block
    b490 - block
    b970 - block
    b871 - block
    b261 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b824 )
    ( on b586 b824 )
    ( on b636 b586 )
    ( on b231 b636 )
    ( on b147 b231 )
    ( on b110 b147 )
    ( on b27 b110 )
    ( on b490 b27 )
    ( on b970 b490 )
    ( on b871 b970 )
    ( on b261 b871 )
    ( clear b261 )
  )
  ( :goal
    ( and
      ( clear b824 )
    )
  )
)
