( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b798 - block
    b749 - block
    b616 - block
    b401 - block
    b558 - block
    b285 - block
    b316 - block
    b295 - block
    b492 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b798 )
    ( on b749 b798 )
    ( on b616 b749 )
    ( on b401 b616 )
    ( on b558 b401 )
    ( on b285 b558 )
    ( on b316 b285 )
    ( on b295 b316 )
    ( on b492 b295 )
    ( clear b492 )
  )
  ( :goal
    ( and
      ( clear b798 )
    )
  )
)
