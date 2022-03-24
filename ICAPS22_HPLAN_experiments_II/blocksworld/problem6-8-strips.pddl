( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b664 - block
    b784 - block
    b925 - block
    b775 - block
    b841 - block
    b316 - block
    b135 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b664 )
    ( on b784 b664 )
    ( on b925 b784 )
    ( on b775 b925 )
    ( on b841 b775 )
    ( on b316 b841 )
    ( on b135 b316 )
    ( clear b135 )
  )
  ( :goal
    ( and
      ( clear b664 )
    )
  )
)
