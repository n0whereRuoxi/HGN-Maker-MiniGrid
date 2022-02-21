( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b647 - block
    b592 - block
    b581 - block
    b88 - block
    b950 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b647 )
    ( on b592 b647 )
    ( on b581 b592 )
    ( on b88 b581 )
    ( on b950 b88 )
    ( clear b950 )
  )
  ( :goal
    ( and
      ( clear b647 )
      ( clear b647 )
      ( clear b647 )
      ( clear b647 )
      ( clear b647 )
    )
  )
)
