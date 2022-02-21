( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b13 - block
    b127 - block
    b729 - block
    b886 - block
    b686 - block
    b649 - block
    b215 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b13 )
    ( on b127 b13 )
    ( on b729 b127 )
    ( on b886 b729 )
    ( on b686 b886 )
    ( on b649 b686 )
    ( on b215 b649 )
    ( clear b215 )
  )
  ( :goal
    ( and
      ( clear b13 )
    )
  )
)
