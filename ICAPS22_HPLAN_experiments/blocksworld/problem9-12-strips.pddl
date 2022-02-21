( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b441 - block
    b639 - block
    b939 - block
    b447 - block
    b605 - block
    b406 - block
    b229 - block
    b647 - block
    b409 - block
    b164 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b441 )
    ( on b639 b441 )
    ( on b939 b639 )
    ( on b447 b939 )
    ( on b605 b447 )
    ( on b406 b605 )
    ( on b229 b406 )
    ( on b647 b229 )
    ( on b409 b647 )
    ( on b164 b409 )
    ( clear b164 )
  )
  ( :goal
    ( and
      ( clear b441 )
    )
  )
)
