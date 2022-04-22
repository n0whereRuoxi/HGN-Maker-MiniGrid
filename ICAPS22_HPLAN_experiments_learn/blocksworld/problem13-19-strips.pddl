( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b38 - block
    b960 - block
    b282 - block
    b615 - block
    b966 - block
    b551 - block
    b677 - block
    b440 - block
    b369 - block
    b567 - block
    b248 - block
    b142 - block
    b998 - block
    b537 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b38 )
    ( on b960 b38 )
    ( on b282 b960 )
    ( on b615 b282 )
    ( on b966 b615 )
    ( on b551 b966 )
    ( on b677 b551 )
    ( on b440 b677 )
    ( on b369 b440 )
    ( on b567 b369 )
    ( on b248 b567 )
    ( on b142 b248 )
    ( on b998 b142 )
    ( on b537 b998 )
    ( clear b537 )
  )
  ( :goal
    ( and
      ( clear b38 )
    )
  )
)
