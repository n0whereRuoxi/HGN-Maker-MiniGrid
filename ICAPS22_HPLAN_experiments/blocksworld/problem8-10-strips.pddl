( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b901 - block
    b572 - block
    b919 - block
    b76 - block
    b648 - block
    b170 - block
    b440 - block
    b125 - block
    b955 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b901 )
    ( on b572 b901 )
    ( on b919 b572 )
    ( on b76 b919 )
    ( on b648 b76 )
    ( on b170 b648 )
    ( on b440 b170 )
    ( on b125 b440 )
    ( on b955 b125 )
    ( clear b955 )
  )
  ( :goal
    ( and
      ( clear b901 )
    )
  )
)
