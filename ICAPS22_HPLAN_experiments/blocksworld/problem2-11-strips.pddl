( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b735 - block
    b539 - block
    b647 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b735 )
    ( on b539 b735 )
    ( on b647 b539 )
    ( clear b647 )
  )
  ( :goal
    ( and
      ( clear b735 )
      ( clear b735 )
      ( clear b735 )
    )
  )
)
