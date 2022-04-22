( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b753 - block
    b415 - block
    b387 - block
    b539 - block
    b425 - block
    b767 - block
    b83 - block
    b242 - block
    b462 - block
    b844 - block
    b657 - block
    b396 - block
    b273 - block
    b467 - block
    b925 - block
    b542 - block
    b655 - block
    b895 - block
    b119 - block
    b636 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b753 )
    ( on b415 b753 )
    ( on b387 b415 )
    ( on b539 b387 )
    ( on b425 b539 )
    ( on b767 b425 )
    ( on b83 b767 )
    ( on b242 b83 )
    ( on b462 b242 )
    ( on b844 b462 )
    ( on b657 b844 )
    ( on b396 b657 )
    ( on b273 b396 )
    ( on b467 b273 )
    ( on b925 b467 )
    ( on b542 b925 )
    ( on b655 b542 )
    ( on b895 b655 )
    ( on b119 b895 )
    ( on b636 b119 )
    ( clear b636 )
  )
  ( :goal
    ( and
      ( clear b753 )
    )
  )
)
