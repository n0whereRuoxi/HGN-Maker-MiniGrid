( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b234 - block
    b774 - block
    b148 - block
    b80 - block
    b305 - block
    b687 - block
    b91 - block
    b419 - block
    b958 - block
    b500 - block
    b155 - block
    b299 - block
    b184 - block
    b364 - block
    b717 - block
    b116 - block
    b877 - block
    b523 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b234 )
    ( on b774 b234 )
    ( on b148 b774 )
    ( on b80 b148 )
    ( on b305 b80 )
    ( on b687 b305 )
    ( on b91 b687 )
    ( on b419 b91 )
    ( on b958 b419 )
    ( on b500 b958 )
    ( on b155 b500 )
    ( on b299 b155 )
    ( on b184 b299 )
    ( on b364 b184 )
    ( on b717 b364 )
    ( on b116 b717 )
    ( on b877 b116 )
    ( on b523 b877 )
    ( clear b523 )
  )
  ( :goal
    ( and
      ( clear b234 )
    )
  )
)
