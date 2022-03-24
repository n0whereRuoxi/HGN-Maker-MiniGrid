( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b762 - block
    b210 - block
    b992 - block
    b105 - block
    b404 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b762 )
    ( on b210 b762 )
    ( on b992 b210 )
    ( on b105 b992 )
    ( on b404 b105 )
    ( clear b404 )
  )
  ( :goal
    ( and
      ( clear b762 )
    )
  )
)
