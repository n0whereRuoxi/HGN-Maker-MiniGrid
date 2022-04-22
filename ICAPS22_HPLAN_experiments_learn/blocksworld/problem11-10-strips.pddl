( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b613 - block
    b400 - block
    b541 - block
    b664 - block
    b623 - block
    b91 - block
    b926 - block
    b760 - block
    b925 - block
    b675 - block
    b919 - block
    b807 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b613 )
    ( on b400 b613 )
    ( on b541 b400 )
    ( on b664 b541 )
    ( on b623 b664 )
    ( on b91 b623 )
    ( on b926 b91 )
    ( on b760 b926 )
    ( on b925 b760 )
    ( on b675 b925 )
    ( on b919 b675 )
    ( on b807 b919 )
    ( clear b807 )
  )
  ( :goal
    ( and
      ( clear b613 )
    )
  )
)
