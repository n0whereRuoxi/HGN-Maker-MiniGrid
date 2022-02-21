( define ( problem probname )
  ( :domain logistics )
  ( :requirements :strips :typing :equality )
  ( :objects
    b68 - block
    b130 - block
    b699 - block
    b805 - block
    b15 - block
    b689 - block
    b954 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b68 )
    ( on b130 b68 )
    ( on b699 b130 )
    ( on b805 b699 )
    ( on b15 b805 )
    ( on b689 b15 )
    ( on b954 b689 )
    ( clear b954 )
  )
  ( :goal
    ( and
      ( clear b68 )
      ( clear b68 )
      ( clear b68 )
      ( clear b68 )
      ( clear b68 )
      ( clear b68 )
      ( clear b68 )
    )
  )
)
