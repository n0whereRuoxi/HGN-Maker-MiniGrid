( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b959 - block
    b409 - block
    b578 - block
    b933 - block
    b993 - block
    b622 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b959 )
    ( on b409 b959 )
    ( on b578 b409 )
    ( on b933 b578 )
    ( on b993 b933 )
    ( on b622 b993 )
    ( clear b622 )
  )
  ( :goal
    ( and
      ( clear b959 )
    )
  )
)
