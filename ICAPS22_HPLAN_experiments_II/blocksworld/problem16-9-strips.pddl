( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b677 - block
    b155 - block
    b502 - block
    b861 - block
    b495 - block
    b785 - block
    b810 - block
    b675 - block
    b435 - block
    b486 - block
    b489 - block
    b439 - block
    b796 - block
    b658 - block
    b321 - block
    b389 - block
    b37 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b677 )
    ( on b155 b677 )
    ( on b502 b155 )
    ( on b861 b502 )
    ( on b495 b861 )
    ( on b785 b495 )
    ( on b810 b785 )
    ( on b675 b810 )
    ( on b435 b675 )
    ( on b486 b435 )
    ( on b489 b486 )
    ( on b439 b489 )
    ( on b796 b439 )
    ( on b658 b796 )
    ( on b321 b658 )
    ( on b389 b321 )
    ( on b37 b389 )
    ( clear b37 )
  )
  ( :goal
    ( and
      ( clear b677 )
    )
  )
)
