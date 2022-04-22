( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b568 - block
    b377 - block
    b928 - block
    b396 - block
    b803 - block
    b443 - block
    b901 - block
    b584 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b568 )
    ( on b377 b568 )
    ( on b928 b377 )
    ( on b396 b928 )
    ( on b803 b396 )
    ( on b443 b803 )
    ( on b901 b443 )
    ( on b584 b901 )
    ( clear b584 )
  )
  ( :goal
    ( and
      ( clear b568 )
    )
  )
)
